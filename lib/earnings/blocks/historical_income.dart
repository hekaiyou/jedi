import 'package:flutter/material.dart';

/// 自定义的历史收益组件。
class HistoricalIncome extends StatefulWidget {
  @override
  _HistoricalIncomeState createState() => _HistoricalIncomeState();
}

/// 与自定义的的历史收益组件关联的状态子类。
class _HistoricalIncomeState extends State<HistoricalIncome> {
  /// 当前选择的索引。
  int _selectedIndex = 0;

  /// 在选择项目上点击时。
  void _onItemTapped(int index) {
    setState(() {
      // 更新当前选择的索引。
      _selectedIndex = index;
    });
  }

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

  /// 构建选择收益周期的容器（`Container`）组件。
  Widget _buildTimeContainer(String name, bool isSelect) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
        // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            // 如果是当前选择项，显示突出的边框颜色。
            color: isSelect
                ? Color(0xffFE7C30)
                : Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          // 如果是当前选择项，显示突出的字体大小。
          fontSize: isSelect ? 16.0 : 14.0,
          color: Color(0xff333333),
          // 如果是当前选择项，显示突出的中黑字体。
          fontFamily: isSelect ? 'PingFangMedium' : 'PingFangRegular',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          // 在两边添加填充空间。
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              // 显示“今日”收益按钮的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _onItemTapped(0);
                  },
                  child: _buildTimeContainer('今日', _selectedIndex == 0),
                ),
              ),
              // 显示“昨日”收益按钮的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _onItemTapped(1);
                  },
                  child: _buildTimeContainer('昨日', _selectedIndex == 1),
                ),
              ),
              // 显示“近7日”收益按钮的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _onItemTapped(2);
                  },
                  child: _buildTimeContainer('近7日', _selectedIndex == 2),
                ),
              ),
              // 显示“近30日”收益按钮的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _onItemTapped(3);
                  },
                  child: _buildTimeContainer('近30日', _selectedIndex == 3),
                ),
              ),
            ],
          ),
        ),
        // 一条容器（`Container`）组件实现的分割线。
        Container(
          color: Color(0xffE2E2E2),
          height: 1.0,
        ),
        Padding(
          // 在两边添加填充空间。
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              // 显示“付款笔数”收益信息的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildIncomeColumn('付款笔数', '￥146'),
                ),
              ),
              // 一竖容器（`Container`）组件实现的分割线。
              Container(
                color: Color(0xffE2E2E2),
                height: 70.0,
                width: 2.0,
              ),
              // 显示“预估收益”收益信息的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildIncomeColumn('预估收益', '￥146'),
                ),
              ),
              // 一竖容器（`Container`）组件实现的分割线。
              Container(
                color: Color(0xffE2E2E2),
                height: 70.0,
                width: 2.0,
              ),
              // 显示“其他收益”收益信息的灵活（`Flexible`）组件。
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildIncomeColumn('其他收益', '￥146'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
