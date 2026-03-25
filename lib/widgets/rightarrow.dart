import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rightarrow extends StatefulWidget {
  const Rightarrow({super.key});

  @override
  State<Rightarrow> createState() => _RightarrowState();
}

class _RightarrowState extends State<Rightarrow> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.arrow_forward_ios);
  }
}
