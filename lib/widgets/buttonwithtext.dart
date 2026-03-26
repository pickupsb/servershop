import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      height: 40.w,
      alignment: Alignment.center,
      child: Text('立即购买',style: TextStyle(color: Colors.white,fontSize: 16.sp),),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.r),
          color: Colors.orange
      ),
    );
  }
}