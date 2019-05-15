import 'package:flutter/material.dart';
import 'package:jedi/my/landing/blocks/login_phone.dart';

/// 自定义的登陆页面组件。
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          // 根据系统操作栏高度自动调整操作区域的高度。
          top: MediaQuery.of(context).padding.top + 64.0,
          left: 16.0,
          right: 16.0,
        ),
        height: 320.0,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(
                    // 半径（`Radius`）类，圆形或椭圆形的半径。
                    // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                    Radius.circular(10.0),
                  ),
                  // 阴影
                  boxShadow: [
                    BoxShadow(
                      //阴影位置
                      offset: Offset(0.0, -1.0),
                      // 阴影颜色。
                      color: Color.fromRGBO(168, 189, 223, 0.34),
                      // 阴影模糊程度，大就更透明更扩散
                      blurRadius: 12.0,
                      // 阴影模糊大小， 负的 缩小 正的 增大
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: LoginPhone(),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 70.0,
                width: 70.0,
                // 这里显示应用的图标。
                child: FlutterLogo(
                  colors: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
