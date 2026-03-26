import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buttonwithtext.dart';
import '../widgets/verificationcodesendandcountdown.dart';

class LoginWithVerificationCode extends StatefulWidget {
  const LoginWithVerificationCode({super.key});

  @override
  State<LoginWithVerificationCode> createState() => _LoginWithVerificationCodeState();
}

class _LoginWithVerificationCodeState extends State<LoginWithVerificationCode> {
  TextEditingController phoneEditingController  = TextEditingController();
  TextEditingController codeEditingController  = TextEditingController();
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
            SizedBox(height: 10.w,),
            GestureDetector(child: Text('密码登录',style: TextStyle(decoration: TextDecoration.underline,)),)
            ,
            SizedBox(height: 20.w,),
            Button('登录', (){

            }),

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

}
