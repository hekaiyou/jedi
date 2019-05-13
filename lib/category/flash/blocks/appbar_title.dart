import 'package:flutter/material.dart';
import 'dart:io';

/// 自定义的应用栏标题组件。
class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 装饰盒（`DecoratedBox`）组件，在子组件绘画之前或之后绘制装饰的组件。
    return DecoratedBox(
      // 装饰（`decoration`）属性，具体怎么画装饰。
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/flash_bar_plate_1.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                // 根据当前系统显示不同的返回按钮。
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Image.asset('assets/flash_bar_title.png'),
            ),
          ),
        ],
      ),
    );
  }
}
