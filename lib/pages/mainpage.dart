import 'package:flutter/material.dart';
import 'package:servershop/pages/homepage.dart';
import 'package:servershop/pages/membercenter.dart';

import 'myserver.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentindex = 0;
  List pages = [Homepage(),Myserver(),Membercenter()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildbottom(),
      body: pages[currentindex],
    );
  }
  Widget buildbottom(){
    return BottomNavigationBar(
        onTap: (v){
          currentindex = v;
          setState(() {

          });
        },
        items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "我的主机"),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "个人中心"),
    ]);
  }
}
