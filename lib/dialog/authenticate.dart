import 'package:alipay_kit/alipay_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servershop/widgets/buttonwithtext.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wechat_authentication/wechat_authentication.dart';

class AuthenticateDialog extends StatefulWidget {
  const AuthenticateDialog({super.key});

  @override
  State<AuthenticateDialog> createState() => _AuthenticateDialogState();
}

class _AuthenticateDialogState extends State<AuthenticateDialog> {
  String _result = "等待认证";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听支付宝回调
    Alipay.instance.payResp().listen((result) {
      setState(() {
        _result = "认证结果：${result.resultStatus}，${result.result}";
      });
      // 9000=成功，6001=用户取消，6002=网络异常
      if (result.resultStatus == "9000") {
        // 服务端查询认证结果
        _queryAuthResult();
      }
    });
  }
  // 1. 从服务端获取 certifyUrl
  Future<String> _getCertifyUrl() async {
    // 替换为你的服务端接口
    // 服务端返回：alipays://platformapi/startapp?appId=xxx&url=xxx
    return "YOUR_CERTIFY_URL_FROM_SERVER";
  }

  // 2. 唤起支付宝实人认证
  Future<void> _startAlipayAuth() async {
    final url = await _getCertifyUrl();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      setState(() => _result = "无法唤起支付宝，请安装后重试");
    }
  }

  // 3. 服务端查询最终认证结果（必须）
  Future<void> _queryAuthResult() async {
    // 调用服务端接口：alipay.user.certify.open.query
    setState(() => _result = "服务端查询认证结果...");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:
          Container(
            padding: EdgeInsets.all(10.w),
            child:Column(
              children: [
                Button('微信认证',(){
                  WechatAuthentication().authenticate('token');
                }),
                SizedBox(height: 10.w,),
                Button('支付宝认证',(){
                  _startAlipayAuth();
                }),
              ],
            ),
          )

    );
  }
}
