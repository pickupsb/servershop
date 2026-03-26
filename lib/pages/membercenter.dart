import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/rightarrow.dart';

class Membercenter extends StatefulWidget {
  const Membercenter({super.key});

  @override
  State<Membercenter> createState() => _MembercenterState();
}

class _MembercenterState extends State<Membercenter> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
         
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue),

                child:
                Column(children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/images/a.png',
                      width: 50.w,
                      height: 50.w,
                    ),
                  ),
                  SizedBox(height: 10.w,),
                  Text('name',style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                  SizedBox(height: 10.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset("assets/images/a.png",width: 20.w,height: 20.w,),
                    SizedBox(width: 10.w,),
                    Text('exp:1/1',style: TextStyle(color: Colors.white),)
                  ],)
                ],)
                ,
              ),
              SizedBox(height: 10,),
              Container(width: 300.w,height: 90.w,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(12)),child: Column(
                children: [
                  Row(children: [
                    Text('我的余额',style: TextStyle(color: Colors.white),)
                  ],),
                  SizedBox(height: 10,),
                  Center(child: Text('￥20',style: TextStyle(color: Colors.white,fontSize: 20.w),),)
                ],
              ),),
              SizedBox(height: 10,),
              Row(children: [SizedBox(width: 20,),Text('账户管理')],),
              Card(
                color: Colors.white,
                child: Container(
                  width: 350.w,
                  child: Column(
                    children: [
                      buildchongzhiitem(),
                      Divider(),
                      buildxiaofeijiluitem(),
                      Divider(),
                      buildzhanghuchongzhiitem(),
                      Divider(),
                      buildquweixiaoyouxiitem(),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.w,),
              Row(children: [SizedBox(width: 20,),Text('账户与工具')],),
              Card(
                color: Colors.white,
                child: Container(
                  width: 350.w,
                  child: Column(
                    children: [
                      buildauthentic()

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ))
      ;
  }
  Widget buildchongzhiitem(){
    return Container(

      height: 40.w,
    width: 350.w,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
        SizedBox(width: 20.w,),
        Text('充值记录',style: TextStyle(),),
        Expanded(child: SizedBox()),
      Rightarrow()
      ],),
    );
  }
  Widget buildxiaofeijiluitem(){
    return Container(

      height: 40.w,
      width: 350.w,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
        SizedBox(width: 20.w,),
        Text('消费记录',style: TextStyle(),),
        Expanded(child: SizedBox()),
        Rightarrow()
      ],),
    );
  }
  Widget buildzhanghuchongzhiitem(){
    return Container(

      height: 40.w,
      width: 350.w,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
        SizedBox(width: 20.w,),
        Text('账户充值',style: TextStyle(),),
        Expanded(child: SizedBox()),
        Rightarrow()
      ],),
    );
  }
  Widget buildquweixiaoyouxiitem(){
    return Container(

      height: 40.w,
      width: 350.w,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
        SizedBox(width: 20.w,),
        Text('趣味小游戏',style: TextStyle(),),
        Expanded(child: SizedBox()),
        Rightarrow()
      ],),
    );
  }

  Widget buildauthentic(){
    return Container(

      height: 40.w,
      width: 350.w,
      padding: EdgeInsets.all(10),
      child: Row(children: [
        Image.asset('assets/images/a.png',width: 20.w,height: 20.w,),
        SizedBox(width: 20.w,),
        Text('实名认证',style: TextStyle(),),
        Expanded(child: SizedBox()),
        Text('已认证'),
        SizedBox(width: 5.w,),
        Rightarrow()
      ],),
    );
  }
}
