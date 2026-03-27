import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servershop/main.dart';
import 'package:servershop/pages/consumerecord.dart';
import 'package:servershop/pages/loginwithpassword.dart';
import 'package:servershop/pages/loginwithverificationcode.dart';
import 'package:servershop/pages/mainpage.dart';
import 'package:servershop/pages/recharge.dart';
import 'package:servershop/pages/rechargerecord.dart';
import 'package:servershop/pages/register.dart';
import 'package:servershop/pages/webviewpage.dart';

import 'authentication.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _PageState();
}

class _PageState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        TextButton(onPressed: (){
          Get.to(Mainpage());
        }, child: Text('主页')),
        TextButton(onPressed: (){
          Get.to(Authentication());
        }, child: Text('授权')),
        TextButton(onPressed: (){
          Get.to(Consumerecord());
        }, child: Text('消费记录')),
        TextButton(onPressed: (){
          Get.to(Loginwithpassword());
        }, child: Text('密码登录')),
        TextButton(onPressed: (){
          Get.to(LoginWithVerificationCode());
        }, child: Text('验证码登录')),
        TextButton(onPressed: (){
          Get.to(Recharge());
        }, child: Text('账号充值')),
        TextButton(onPressed: (){
          Get.to(Rechargerecord());
        }, child: Text('充值记录')),
        TextButton(onPressed: (){
          Get.to(Register());
        }, child: Text('注册')),
        TextButton(onPressed: (){
          Get.to(Webviewpage('https://www.baidu.com/'));
        }, child: Text('集成网页')),

      ],
    );
  }
}
