import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alipay_kit/alipay_kit.dart';

class AlipayRealAuthPage extends StatefulWidget {
  const AlipayRealAuthPage({super.key});

  @override
  State<AlipayRealAuthPage> createState() => _AlipayRealAuthPageState();
}

class _AlipayRealAuthPageState extends State<AlipayRealAuthPage> {
  String _result = "等待认证";

  @override
  void initState() {
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
    return Scaffold(
      appBar: AppBar(title: const Text("支付宝实人认证")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startAlipayAuth,
              child: const Text("开始支付宝实人认证"),
            ),
          ],
        ),
      ),
    );
  }
}