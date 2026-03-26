import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:servershop/pages/webviewpage.dart';
import 'package:servershop/widgets/buttonwithtext.dart';
import 'package:servershop/widgets/verificationcodesendandcountdown.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneEditingController  = TextEditingController();
  TextEditingController codeEditingController  = TextEditingController();
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: 375.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 20.w,right: 20.w),
        child:Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('手机号'),
            SizedBox(height: 10.w,),
            buildphonenum(),
            SizedBox(height: 20.w,),
            Text('验证码'),
            SizedBox(height: 10.w,),
            verificationcode(),
            SizedBox(height: 20.w,),
            Button('注册', (){

            }),
            SizedBox(height: 10.w,),
            agreement()
          ],
        ) ,
      )
      ,
    );
  }

  Widget buildphonenum(){
    return Container(height: 40.w,
    child: TextField(

      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5.w),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.w),borderSide: BorderSide(color: Colors.grey))
      ),
    ),
    );
  }

  Widget verificationcode(){
    return Row(
      children: [
        Expanded(child:
        TextField(

          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.w),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.w),borderSide: BorderSide(color: Colors.grey))
          ),
        )
        ),
        TimerCountDownWidget(onTimerFinish: (){})
      ],
    );
  }
  Widget agreement(){
    return Row(
      children: [
        SizedBox(width: 20.w,height: 20.w,child: Checkbox(value: agree, onChanged: (v){

          setState(() {
            if(v!=null){
              agree  = v;
            }
          });
        }),),
        SizedBox(width: 10.w,),
        Text('我已同意并阅读'),
        SizedBox(width: 10.w,),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.to(Webviewpage('url'));
          },
          child: Text('<<实名认证服务条款>>',style: TextStyle(color: Colors.blue),),
        )


      ],
    );
  }
}
