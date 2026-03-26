import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:servershop/commondata/commonstyle.dart';

import '../widgets/backwidget.dart';

class Consumerecord extends StatefulWidget {
  const Consumerecord({super.key});

  @override
  State<Consumerecord> createState() => _ConsumerecordState();
}

class _ConsumerecordState extends State<Consumerecord> {
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
    return Scaffold(
      appBar: AppBar(
        leading: Backwidget(),
        title: Text(
          '充值记录',
          style: TextStyle( fontSize: 20.sp),
        ),
      ),
      body: SmartRefresher(
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
        child: buildlist(),
      ),
    );
  }
  Widget buildlist(){
    return

        SingleChildScrollView(child:
        Align(
          alignment: Alignment.topCenter,
          child: Container(
          width: 350.w,
// padding: EdgeInsets.only(bottom: 20),
          child: ListView.separated(
            separatorBuilder: (c,i){
              return Divider();
            },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              padding: EdgeInsets.only(left: 0,right: 0),
              itemBuilder: (c,i){
                return builditem();
              }),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [CommonStyle.boxShadow]
          ),
        ),)
        ,)

      ;
  }
  Widget  builditem(){
    return Container(width: 350.w,
    padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-7',style: TextStyle(color: Colors.green),),
              Text('上机',style: TextStyle(color: Colors.green),),

            ],
          ),
          SizedBox(height: 10.w,),
          Text('A19240'),
          SizedBox(height: 10.w,),
          Text('2025-12-12 11:11:11'),
        ],
      ),
    );
  }
}
