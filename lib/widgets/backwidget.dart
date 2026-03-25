import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Backwidget extends StatefulWidget {
  Function? function;
    Backwidget({super.key});

  @override
  State<Backwidget> createState() => _BackwidgetState();
}

class _BackwidgetState extends State<Backwidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.arrow_back_ios),
      onTap: (){
        if(widget.function==null){
          Get.back();
        }else{
          widget.function?.call();
        }

      },
    );
  }
}
