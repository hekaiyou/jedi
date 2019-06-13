import 'package:flutter/material.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/internet/api_commodity.dart';

/// 启动页面组件。
class InitiatePage extends StatefulWidget {
  @override
  _InitiatePageState createState() => _InitiatePageState();
}

/// 与启动页面组件关联的状态子类。
class _InitiatePageState extends State<InitiatePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _loadInformation();
    });
  }

  // 加载信息。
  _loadInformation() async {
    apiGetGoodscategory().then((onValue) {
      apiGetBbscategory().then((onValue) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/navigation', (Route<dynamic> route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '欢迎\n使用',
          style: TextStyle(
            fontSize: 23.0,
          ),
        ),
      ),
    );
  }
}
