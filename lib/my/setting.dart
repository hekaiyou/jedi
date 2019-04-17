import 'package:flutter/material.dart';
//import 'package:nautilus/nautilus.dart' as nautilus;

/// 自定义的设置页面组件。
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '设置',
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff000000),
            fontFamily: 'PingFangMedium',
          ),
        ),
      ),
      body: FlatButton(
        child: Text('访问淘宝'),
        onPressed: () {
          //nautilus.login();
        },
      ),
    );
  }
}
