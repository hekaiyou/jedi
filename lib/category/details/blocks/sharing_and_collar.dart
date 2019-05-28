import 'package:flutter/material.dart';
import 'package:nautilus/nautilus.dart' as nautilus;

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
            child: GestureDetector(
              onTap: () {
                print('openURL……');
                // pageUrl：页面地址；backUrl：返回地址；extParams：传递的临时参数；
                // taoKeParams：传递的淘客参数；needPush：是否需要推送，仅适用于iOS；
                // schemeType：方案类型，支持`tmall_scheme`和`taobao_scheme`，默认值为`tmall_scheme`；
                // openType：打开类型；openNativeFailedMode：打开本机失败模式；
                nautilus.openUrl(
                  openType: nautilus.OpenType.NATIVE,
                  pageUrl:
                      'https://uland.taobao.com/coupon/edetail?e=%2F9W3z1XgWkQNfLV8niU3RwXoB%2BDaBK5LQS0Flu%2FfbSpinP2GYChM67sPlpg2KVNfy5FOJP2gSFVKtlcJRLR%2FXlzlvYi56QBxL%2BtqJsLbVma0Xsj%2FjC%2BGLYm5Hm0kC2UyGbU%2BMp%2FiThXsA2ynhEm4s9gPPY1ATew7DwXpngDDmD%2FehO670y3iNIKz4DAaBdpBIuVEmpUZQNjn1ap%2BXMS85du1tLb6KOkTnUqGHaBBNog%3D&&app_pvid=59590_11.8.67.128_18978_1558529668320&ptl=floorId:2836;app_pvid:59590_11.8.67.128_18978_1558529668320;tpp_pvid:100_11.9.3.85_35499_9361558529668324384&xId=C9EwZ80AafEzyKtIg48FlHTtVxmnSPxoK8N5guURDamiZgQcStp246JjMCaLa94cNIM9mAj0WI0rpyWSGFxO4h&union_lens=lensId:0b084380_0cb4_16adf9b7592_bc2f&relationId=560133319',
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
                  '领券￥10',
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
