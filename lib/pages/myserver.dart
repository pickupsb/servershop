import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myserver extends StatefulWidget {
  const Myserver({super.key});

  @override
  State<Myserver> createState() => _MyserverState();
}

class _MyserverState extends State<Myserver> {
  String? value;
  bool check = false;
  bool batchmodify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          '我的主机',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        bottom: PreferredSize(
          preferredSize: Size(375.w, 160.w),
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300.w,
                      height: 40.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16.w),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/images/a.png",
                              width: 16.w,
                              height: 16.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Image.asset(
                        'assets/images/a.png',
                        width: 40.w,
                        height: 40.w,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 125.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        value: value,
                        hint: Text('排序方式'),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '按上机时间',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjsj',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按实际最多',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjzd',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按实际最少',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjzs',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按有分组',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'yfz',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按没有分组',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'myfz',
                          ),
                        ],
                        onChanged: (v) {
                          value = v;
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      width: 125.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        value: value,
                        hint: Text('排序方式'),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              '按上机时间',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjsj',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按实际最多',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjzd',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按实际最少',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'sjzs',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按有分组',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'yfz',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              '按没有分组',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            value: 'myfz',
                          ),
                        ],
                        onChanged: (v) {
                          value = v;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.w,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: check,
                            onChanged: (v) {
                              if (v != null) {
                                check = v;
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(width: 5.w),
                          Text('全选', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        batchmodify = !batchmodify;
                        setState(() {

                        });
                      },
                      child: Container(
                        width: 160.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.orange
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/a.png",width: 20.w,height: 20.w,),
                            SizedBox(width: 10.w,),
                            Text('批量操作',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: buildlist(),
    );
  }

  Widget buildlist(){
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (v,i){
      return builditem();
    });
  }
  ///编号 套餐 状态 剩余时间
  Widget builditem(){
    return
      Stack(children: [
        Card(
          color: Colors.white,
          child: Container(width: 350.w,
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(children: [
                  Expanded(child: Text('编号',style: TextStyle(color: Colors.grey,fontSize: 16.sp,),))
                  ,
                  Expanded(child: Text("11111",style: TextStyle(fontSize: 16.sp,),))
                  ,
                ],),
                SizedBox(height: 10.w,),
                Row(children: [
                  Expanded(child: Text('套餐',style: TextStyle(color: Colors.grey,fontSize: 16.sp,),))
                  ,
                  Expanded(child: Text("套餐一",style: TextStyle(fontSize: 16.sp,),))
                  ,
                ],),
                SizedBox(height: 10.w,),
                Row(children: [
                  Expanded(child: Text('剩余时间',style: TextStyle(color: Colors.grey,fontSize: 16.sp,),))
                  ,
                  Expanded(child: Text("11111",style: TextStyle(fontSize: 16.sp,),))
                  ,
                ],),
                SizedBox(height: 10.w,),
                Row(children: [
                  Expanded(child: Text('状态',style: TextStyle(color: Colors.grey,fontSize: 16.sp,),))
                  ,
                  Expanded(child: Text("11111",style: TextStyle(fontSize: 16.sp,),))
                  ,
                ],),
                SizedBox(height: 10.w,),
              ],
            ),
          ),
        ),
        Positioned(
            right: 20,
            top: 10,
            child:
            IgnorePointer(
              ignoring: !batchmodify,
              child:
              Visibility(
                visible: batchmodify,
                child: Checkbox(value: false, onChanged: (v){}) ,))


        )
      ],)
      ;
  }
}
