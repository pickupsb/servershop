import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widgets/button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int current = 1;
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 375.w,
          // height: 700.w,
          child:
          SmartRefresher(
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context,LoadStatus? mode){
                Widget body ;
                if(mode==LoadStatus.idle){
                  body =  Text("pull up load");
                }
                else if(mode==LoadStatus.loading){
                  body =  CupertinoActivityIndicator();
                }
                else if(mode == LoadStatus.failed){
                  body = Text("Load Failed!Click retry!");
                }
                else if(mode == LoadStatus.canLoading){
                  body = Text("release to load more");
                }
                else{
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: _refreshController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 370.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/a.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(width: 10.w),
                          Text('系统公告', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 300.w,
                        height: 30.w,
                        child: Marquee(
                          text:
                          'There once was a boy who told this story about a boy: "',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                buildtitle(),
                SizedBox(height: 30.h),
                buildtype(),
                SizedBox(height: 30.h),
                buildlist(),
              ],
            ),
          ),
          )
          ,
        ),
      ),
    );
  }

  Widget buildtitle() {
    return Row(
      children: [
        SizedBox(width: 16.w),
        Text('主机套餐', style: TextStyle(fontSize: 20.sp)),
      ],
    );
  }

  Widget buildtype() {
    return Row(
      children: [
        SizedBox(width: 16.w),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            current = 1;
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: current == 1 ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Text(
              '有货',
              style: TextStyle(
                color: current == 1 ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            current = 2;
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: current == 2 ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '缺货',
              style: TextStyle(
                color: current == 2 ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            current = 3;
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              color: current == 3 ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '全部',
              style: TextStyle(
                color: current == 3 ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildlist() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (c, i) {
        return builditem();
      },
    );
  }

  Widget builditem() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      // width: 350.w,
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(20),
            height: 110.w,
            child: Column(
              children: [
                Text('套餐一', style: TextStyle(fontSize: 20.sp)),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      child: Text(
                        '18核36线程',
                        style: TextStyle(color: Colors.blue),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withAlpha(90),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            // height: 100.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text('CPU', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: Text('显卡', style: TextStyle(color: Colors.grey)),
                    ),
                    // Align(alignment: Alignment.centerLeft,child: Text('CPU',style: TextStyle(color: Colors.grey),),),
                    // Align(alignment: Alignment.centerLeft,child: Text('显卡',style: TextStyle(color: Colors.grey),),),
                  ],
                ),
                SizedBox(height: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text('2696v3', style: TextStyle())),
                    Expanded(child: Text('1066(6G)', style: TextStyle())),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text('内存', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: Text('硬盘', style: TextStyle(color: Colors.grey)),
                    ),
                    // Align(alignment: Alignment.centerLeft,child: Text('CPU',style: TextStyle(color: Colors.grey),),),
                    // Align(alignment: Alignment.centerLeft,child: Text('显卡',style: TextStyle(color: Colors.grey),),),
                  ],
                ),
                SizedBox(height: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text('三星64GB', style: TextStyle())),
                    Expanded(child: Text('512G', style: TextStyle())),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text('带宽', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: Text('可用数量', style: TextStyle(color: Colors.grey)),
                    ),
                    // Align(alignment: Alignment.centerLeft,child: Text('CPU',style: TextStyle(color: Colors.grey),),),
                    // Align(alignment: Alignment.centerLeft,child: Text('显卡',style: TextStyle(color: Colors.grey),),),
                  ],
                ),
                SizedBox(height: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text('500M', style: TextStyle())),
                    Expanded(
                      child: Row(
                        children: [
                          Text('0台', style: TextStyle()),
                          SizedBox(width: 10),
                          buildoutofstock(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.w),
                Divider(),
                SizedBox(height: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey,
                      ),
                      padding: EdgeInsets.all(3.w),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/a.png',
                            width: 30.w,
                            height: 30.w,
                          ),
                          SizedBox(width: 5.w),
                          Text('A组机房'),
                          SizedBox(width: 5.w),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            child: Text(
                              '0台',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey,
                      ),
                      padding: EdgeInsets.all(3.w),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/a.png',
                            width: 30.w,
                            height: 30.w,
                          ),
                          SizedBox(width: 5.w),
                          Text('A组机房'),
                          SizedBox(width: 5.w),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            child: Text(
                              '0台',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.w),
                Divider(),
                SizedBox(height: 5.w),
                LayoutBuilder(
                  builder: (context, contraint) {
                    return Container(
                      width: contraint.maxWidth,
                      height: 100,
                      padding: EdgeInsets.all(11),
                      child: Row(children: [
                        Image.asset('assets/images/a.png',width: 30.w,height: 30.w,),
                        SizedBox(width: 16.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('原价：￥9.0/天',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough,fontSize: 16.sp),),
                            SizedBox(height: 16.w,),
                            Row(children: [Text('￥8.9/天',style: TextStyle(color: Colors.blue, fontSize: 20.sp,fontWeight: FontWeight.bold),),SizedBox(width: 10,),
                            Container(
                              child: Text('0.99折',style: TextStyle(color: Colors.orange,fontSize: 12.sp),),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.w),color: Colors.orange.withAlpha(100)),padding: EdgeInsets.all(3.w),)
                            ],)
                            ,
                          ],
                        )
                      ],),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue.withAlpha(90),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.w,),
                Button()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildoutofstock() {
    return Container(
      decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.3)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Image.asset('assets/images/a.png', width: 16.w, height: 16.w),
          Text('缺货', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
