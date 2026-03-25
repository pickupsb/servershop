import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servershop/widgets/backwidget.dart';

class Rechargerecord extends StatefulWidget {
  const Rechargerecord({super.key});

  @override
  State<Rechargerecord> createState() => _RechargerecordState();
}

class _RechargerecordState extends State<Rechargerecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Backwidget(),
        title: Text(
          '充值记录',
          style: TextStyle( fontSize: 20.sp),
        ),
      ),
      body: ListView.builder(itemBuilder: (c,i){
return builditem();
      }),
    );
  }
  Widget builditem(){
    return
      Card(
        color: Colors.white,
        child: Container(
width: 310.w,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('20',style: TextStyle(color: Colors.green,fontSize: 21.sp),)
            ],),
            SizedBox(height: 10,),
            Text('微信'),
            SizedBox(height: 10,),
            Text('2021'),
          ],
        ),
      ),)
      ;
  }
}
