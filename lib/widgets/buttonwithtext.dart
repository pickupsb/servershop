import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatefulWidget {
  String text;
  Function function;
  Button(this.text,this.function,{super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return
    Align(alignment: Alignment.topCenter,child: GestureDetector(
      onTap: (){
        widget.function();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 290.w,
        height: 40.w,
        alignment: Alignment.center,
        child: Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 16.sp),),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.r),
            color: Colors.orange
        ),
      ),),)

      ;
  }

}