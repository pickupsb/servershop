import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart';
import 'package:icon_checkbox/icon_checkbox.dart';
import 'package:servershop/commondata/commonstyle.dart';
import 'package:servershop/widgets/buttonwithimage.dart';
import 'package:servershop/widgets/imagecheckbox.txt';
import 'package:tobias/tobias.dart';

import '../widgets/backwidget.dart';
import '../widgets/buttonwithtext.dart';
import '../widgets/imagecheckbox.dart';

class Recharge extends StatefulWidget {
  const Recharge({super.key});

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  ///1微信 2支付宝
  int paytype = 1;

  TextEditingController textEditingController = TextEditingController();
  int? currentselect;

  ///微信支付
  final Fluwx fluwx = Fluwx();
  final String _url = 'https://wxpay.wxutil.com/pub_v2/app/app_pay.php';
  String _result = '无';
  late Function(WeChatResponse) responseListener;
  Tobias tobias = Tobias();

  @override
  void dispose() {
    super.dispose();
    fluwx.removeSubscriber(responseListener);
  }

  @override
  void initState() {
    super.initState();
    responseListener = (response) {
      if (response is WeChatPaymentResponse) {
        setState(() {
          _result = 'pay :${response.isSuccessful}';
        });
      }
    };
    fluwx.addSubscriber(responseListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Backwidget(),
        title: Text(
          '账户充值',
          style: TextStyle( fontSize: 20.sp),
        ),
      ),
      body:
      SizedBox(width: 375.w,child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rechargeamount(),
          SizedBox(height: 10.w,),
          buildpayment(),
          SizedBox(height: 10.w,),
          Button('立即购买',(){
            if(paytype==1){
              ///支付信息，实际上要从后端获取
              Map<String, dynamic> result = {};
              fluwx
                  .pay(
                  which: Payment(
                    appId: result['appid'].toString(),
                    partnerId: result['partnerid'].toString(),
                    prepayId: result['prepayid'].toString(),
                    packageValue: result['package'].toString(),
                    nonceStr: result['noncestr'].toString(),
                    timestamp: result['timestamp'],
                    sign: result['sign'].toString(),
                  ));
            }else{
              tobias.pay('yourOrder');
            }

          })
        ],
      ),)
       ,
    );
  }
  Widget rechargeamount(){
    return
      Container(
        height: 220.w,
        width: 350.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [CommonStyle.boxShadow]
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('充值金额',style: TextStyle(fontSize: 20.w),),
          SizedBox(height: 10.w,),
          Expanded(child: GridView.builder(
              // padding: EdgeInsets.only(left: 10.w,right: 10.w),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2,crossAxisSpacing: 9.w,mainAxisSpacing: 10.w), itemBuilder: (c,i){
            return builditem(i);
          }))
          ,
          buildinput()
        ],)
        ,
      )
      ;
  }

  Widget builditem(int index){
    return
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){

setState(() {
  currentselect = index;
});
        },
        child: Container(
        width: 100.w,
        height: 50.w,
        alignment: Alignment.center,
        child: Text('100元',style: TextStyle(color: currentselect==index?Colors.purple:Colors.black),),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.r),border: Border.all(color: currentselect==index?Colors.purple:Colors.grey,width: 1.w),),

      ),)
      ;
  }

  Widget buildinput(){
    return
      Container(width: 330.w,height:40.w,child: TextField(
        controller:  textEditingController,
        decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 5.w,top: 5.w,right: 5.w),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),borderSide: BorderSide(color: Colors.grey))),
      ),)
      ;
  }

  Widget buildpayment(){
    return Container(
      height: 200.w,
      width: 350.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [CommonStyle.boxShadow]
      ),
      child:
      RadioGroup<int>(onChanged: ( v){
        if(v!=null){
          paytype = v;
        }

      }, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('支付方式',style: TextStyle(fontSize: 20.w),),
          SizedBox(height: 10.w,),
          Container(
            width: 300.w,
            height: 40.w,
            padding: EdgeInsets.all(5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset('assets/images/a.png',width: 30.w,height: 30.w,),
                SizedBox(width: 10.w,),
                Text('微信'),
                Expanded(child: SizedBox()),

                SizedBox(width: 30.w,height: 30.w,child:
                Radio<int>(value: 1)
                // Imagecheckbox( checktimg: 'assets/images/a.png', uncheckimg: 'assets/images/1.jpg', width: 20, height: 20, check: true, onchange: (bool p1) {
                //
                //   if(p1==true){
                //     paytype = 1;
                //   }
                //
                // },)
                  ,)
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey,width: 1.w)
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 300.w,
            height: 40.w,
            padding: EdgeInsets.all(5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset('assets/images/a.png',width: 30.w,height: 30.w,),
                SizedBox(width: 10.w,),
                Text('支付宝'),
                Expanded(child: SizedBox()),
                SizedBox(width: 30.w,height: 30.w,child:
                Radio<int>(value: 2)
                // Imagecheckbox( checktimg: 'assets/images/a.png', uncheckimg: 'assets/images/1.jpg', width: 20, height: 20, check: true, onchange: (bool p1) {  },)
                  ,)
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey,width: 1.w)
            ),
          )
        ],))

      ,
    )
    ;
  }
}
