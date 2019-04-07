import 'package:flutter/material.dart';
import 'package:jedi/earnings/blocks/historical_income.dart';

/// 自定义的线上收益组件。
class OnlineIncome extends StatefulWidget {
  @override
  _OnlineIncomeState createState() => _OnlineIncomeState();
}

/// 与自定义的的线上收益组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _OnlineIncomeState extends State<OnlineIncome>
    with AutomaticKeepAliveClientMixin {
  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  /// 构建显示收入信息的列组件。
  Widget _buildIncomeColumn(String title, String income) {
    return Column(
      children: <Widget>[
        // 用来显示收入描述文本的文本（`Text`）组件。
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xff666666),
            fontFamily: 'PingFangRegular',
          ),
        ),
        // 用来显示收入具体数值的文本（`Text`）组件。
        Text(
          income,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff333333),
            fontFamily: 'PingFangRegular',
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // 设置列表视图周围的填充，避免影响布局效果。
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: 50.0,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 8.0),
          // 用来显示“上月结算收益”的文本（`Text`）组件。
          child: Text.rich(
            TextSpan(
              text: '上月结算收益：',
              children: [
                TextSpan(
                  text: '￥146',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: 'PingFangRegular',
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          color: Color(0xffE2E2E2),
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              // 用来显示“上月预估收益”的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildIncomeColumn('上月预估收益', '￥146'),
                ),
              ),
              Container(
                color: Color(0xffE2E2E2),
                height: 70.0,
                width: 2.0,
              ),
              // 用来显示“本月预估收益”的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildIncomeColumn('本月预估收益', '￥146'),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xffF6F6F6),
          height: 10.0,
        ),
        HistoricalIncome(),
        Container(
          color: Color(0xffF6F6F6),
          height: 10.0,
        ),
        // 用来显示“收益结算明细”按钮的容器（`Container`）组件。
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 50.0,
          alignment: Alignment.centerLeft,
          child: Text(
            '收益结算明细',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff666666),
              fontFamily: 'PingFangRegular',
            ),
          ),
        ),
        Container(
          color: Color(0xffE2E2E2),
          height: 1.0,
        ),
        // 用来显示“提现记录”按钮的容器（`Container`）组件。
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 50.0,
          alignment: Alignment.centerLeft,
          child: Text(
            '提现记录',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff666666),
              fontFamily: 'PingFangRegular',
            ),
          ),
        ),
        Container(
          color: Color(0xffF6F6F6),
          height: 10.0,
        ),
      ],
    );
  }
}
