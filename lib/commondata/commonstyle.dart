import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonStyle{
  static BoxShadow boxShadow =  BoxShadow(
    color: Color.fromRGBO(50, 50, 93, 0.25),
    blurRadius: 5,
    spreadRadius: -1,
    offset: Offset(0, 2),
  );
  static InputDecoration getIputdecoration(String hint){
     return InputDecoration(
       hintText: hint
     );
   }

}