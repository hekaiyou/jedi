import 'package:flutter/material.dart';

/// 自定义的优惠券组件。
class DiscountRate extends StatelessWidget {
  /// 优惠券折扣。
  final String couponPrice;

  DiscountRate({
    this.couponPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/recommended_volume.png',
          width: 19.0,
          height: 16.0,
          fit: BoxFit.fill,
        ),
        // 用来显示优惠券折扣的容器（`Container`）组件。
        Container(
          height: 16.0,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/recommended_volume_2.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
          child: Text(
            '￥' + couponPrice,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontFamily: 'PingFangMedium',
              fontSize: 11.0,
            ),
          ),
        ),
        Image.asset(
          'assets/recommended_volume_3.png',
          width: 3.0,
          height: 16.0,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
