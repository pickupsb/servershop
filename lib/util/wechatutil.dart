import 'package:fluwx/fluwx.dart';

class WechatInstance{
  static Fluwx _fluwx = Fluwx();
  static Fluwx instance() {
    return _fluwx;
  }
  Future<void> init() async {
    await _fluwx.registerApi(
      appId: 'wxd930ea5d5a258f4f',
      doOnAndroid: true,
      doOnIOS: true,
      universalLink: 'https://your.univerallink.com/link/',
    );
  }
}