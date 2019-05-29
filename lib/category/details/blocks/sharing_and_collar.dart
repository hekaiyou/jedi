import 'package:flutter/material.dart';
import 'package:nautilus/nautilus.dart' as nautilus;

/// 自定义的分享与领劵组件。
class SharingAndCollar extends StatelessWidget {
  final String couponAmount;
  final String couponShareUrl;

  SharingAndCollar({
    this.couponAmount,
    this.couponShareUrl,
  });

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
            child: GestureDetector(
              onTap: () {
                // pageUrl：页面地址；backUrl：返回地址；extParams：传递的临时参数；
                // taoKeParams：传递的淘客参数；needPush：是否需要推送，仅适用于iOS；
                // schemeType：方案类型，支持`tmall_scheme`和`taobao_scheme`，默认值为`tmall_scheme`；
                // openType：打开类型；openNativeFailedMode：打开本机失败模式；
                nautilus.openUrl(
                  openType: nautilus.OpenType.NATIVE,
                  pageUrl: 'https:$couponShareUrl',
                );
              },
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
                  '领券￥$couponAmount',
                  style: TextStyle(
                    fontFamily: 'PingFangMedium',
                    fontSize: 18.0,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
