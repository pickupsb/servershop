import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/buttonwithtext.dart';

class Loginwithpassword extends StatefulWidget {
  const Loginwithpassword({super.key});

  @override
  State<Loginwithpassword> createState() => _LoginwithpasswordState();
}

class _LoginwithpasswordState extends State<Loginwithpassword> {
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
            Text('密码'),
            SizedBox(height: 10.w,),
            buildpassword(),
            SizedBox(height: 10.w,),
            GestureDetector(child: Text('验证码登录',style: TextStyle(decoration: TextDecoration.underline,)),)
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
  Widget buildpassword(){
    return Container(height: 40.w,
      child: TextField(
obscureText: true,
        decoration: InputDecoration(

            contentPadding: EdgeInsets.all(5.w),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.w),borderSide: BorderSide(color: Colors.grey))
        ),
      ),
    );
  }

}
