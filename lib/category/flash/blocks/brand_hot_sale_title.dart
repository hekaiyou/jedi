import 'package:flutter/material.dart';

/// 自定义的品牌热卖标题组件。
class BrandHotSaleTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 用一个颜色（`color`）属性设置白色背景。
      color: Color(0xffFFFFFF),
      // 用一个填充（`padding`）属性在周围制造空白空间。
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 29.0,
      ),
      // 第一个行（`Row`）组件，把前面的标示文本与后面的可以操作文本分开。
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 第二个行（`Row`）组件，前面的标示文本。
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '品牌热卖',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: 'PingFangBold',
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: 6.0),
              Text(
                '全场历史低价',
                style: TextStyle(
                  color: Color(0xff999999),
                  fontFamily: 'PingFangMedium',
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          // 第三个行（`Row`）组件，后面的可以操作文本。
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '查看更多',
                style: TextStyle(
                  color: Color(0xffCECECE),
                  fontFamily: 'PingFangBold',
                  fontSize: 12.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Image.asset('assets/flash_bar_more.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
