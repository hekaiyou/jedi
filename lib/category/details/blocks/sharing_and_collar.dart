import 'package:flutter/material.dart';

/// 自定义的分享与领劵组件。
class SharingAndCollar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.0,
      child: Row(
        children: <Widget>[
          // 显示分享按钮的灵活（`Flexible`）组件。
          Flexible(
            flex: 19,
            child: Container(
              alignment: Alignment.center,
              // 装饰（`decoration`）属性，子组件背后的装饰。
              // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
              decoration: BoxDecoration(
                // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                // 装饰图片（`DecorationImage`）类，框装饰的图像。
                image: DecorationImage(
                  image: AssetImage('assets/details_share_gradient.png'),
                  // 适应属性，如何在框里展示图像。
                  // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                '分享',
                style: TextStyle(
                  fontFamily: 'PingFangMedium',
                  fontSize: 18.0,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          // 显示领券按钮的灵活（`Flexible`）组件。
          Flexible(
            flex: 31,
            child: Container(
              alignment: Alignment.center,
              // 装饰（`decoration`）属性，子组件背后的装饰。
              // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
              decoration: BoxDecoration(
                // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                // 装饰图片（`DecorationImage`）类，框装饰的图像。
                image: DecorationImage(
                  image: AssetImage('assets/details_coupon_gradient.png'),
                  // 适应属性，如何在框里展示图像。
                  // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                '领券￥10',
                style: TextStyle(
                  fontFamily: 'PingFangMedium',
                  fontSize: 18.0,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
