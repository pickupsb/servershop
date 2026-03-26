import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:servershop/commondata/commonstyle.dart';
import 'package:servershop/pages/webviewpage.dart';
import 'package:servershop/widgets/buttonwithtext.dart';

import '../widgets/backwidget.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  InputDecoration getInputdecoration(String hint){
    InputDecoration inputDecoration = InputDecoration(
      hintText: hint,
        contentPadding: EdgeInsets.all(5.w),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 1),borderRadius: BorderRadius.circular(10.w)),
        filled: true,
        fillColor: Colors.white
    );
    return inputDecoration;
  }
  TextStyle textStyle  = TextStyle(
    fontSize: 12.sp
  );
  TextEditingController phonecontroler = TextEditingController();
  TextEditingController verificationcodecontroler = TextEditingController();
  TextEditingController namecontroler = TextEditingController();
  TextEditingController idcontroler = TextEditingController();
  bool agree = false;
  // TextEditingController phonecontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Backwidget(),
        title: Text(
          '实名认证',
          style: TextStyle( fontSize: 20.sp),
        ),
      ),
      body:
      Align(
        alignment: Alignment.topCenter,
        child:
            Column(children: [
              Container(
              height: 300.w,
              width: 350.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(color:Colors.white,boxShadow: [CommonStyle.boxShadow],borderRadius: BorderRadius.circular(12.r)),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('真实姓名',style: textStyle,),
                  SizedBox(height: 5.w,),

                  TextField(

                    decoration: getInputdecoration('请输入您的姓名'),
                  ),
                  SizedBox(height: 10.w,),
                  Text('身份证号码',style: textStyle,),
                  SizedBox(height: 5.w,),
                  TextField(
                    decoration: getInputdecoration('请输入您的身份证号码'),
                  ),
                  SizedBox(height: 10.w,),
                  agreement(),
                  Button('立即认证',(){})
                ],),
            ),
              SizedBox(height: 10.w,),
              buildauthentictips()
            ],)

        // IntrinsicHeight(child:  ,)
       ,
      )
      ,
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

  Widget buildauthentictips(){
    return Container(
      width: 350.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(color: Colors.orange.withAlpha(100),borderRadius: BorderRadius.circular(10.r),),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
              SizedBox(width: 10.w,),
              Text('认证须知',style: TextStyle(color: Colors.orange),)
            ],
          ),
          buildtext('1. 请确保填写的信息真实有效，信息将用于账号安全验证'),
          SizedBox(height: 5.w,),
          buildtext('2. 身份信息仅用于实名认证，我们将严格保护您的隐私'),
          SizedBox(height: 5.w,),
          buildtext('3. 认证成功后将无法修改，请仔细核对信息'),
          SizedBox(height: 5.w,),
        ],
      ),
    );
  }
  Widget buildtext(String data){
    return Text(data,style: TextStyle(),);
  }
}
