import 'package:flutter/material.dart';
import 'package:jedi/blocks/recommend_you_item.dart';

/// 自定义的为你推荐组件。
List<Container> recommendYou() {
  /// 每行可以显示的数量。
  final int rowNum = 2;

  /// 当前行已经有多少组件。
  int _row = 0;

  /// 返回包装在容器（`Container`）组件里的行（`Row`）组件列表。
  List<Container> _rowList = [];

  /// 包装在灵活（`Flexible`）组件里的容器（`Container`）组件列表。
  /// 临时存储当前行的数据，最大行数满了就清理一次。
  List<Flexible> _columnList = [];

  for (RecommendItem recommendItem in _items) {
    _columnList.add(
      // 控制行（`Row`）、列（`Column`）或柔性（`Flex`）的子项如何灵活放置的组件。
      Flexible(
        // 柔性（`flex`）属性，用于这个子组件的弹性因子。
        flex: 1,
        child: RecommendYouItem(
          row: _row,
          recommendItem: recommendItem,
        ),
      ),
    );

    // 当前行数执行自加操作。
    _row++;

    // 当前行数等于每行最大可以显示的数量时，将数据添加进返回的数据列表，同时清理临时数据列表。
    if (_row == rowNum) {
      _rowList.add(
        Container(
          margin: EdgeInsets.only(
            left: 13.0,
            right: 13.0,
            bottom: 12.0,
          ),
          child: Row(
            children: _columnList,
          ),
        ),
      );
      _columnList = [];
      _row = 0;
    }
  }

  return _rowList;
}

/// 自定义的为你推荐标题组件。
class RecommendYouTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 1.0,
            width: 66.0,
            color: Color(0xffFE823A),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 4.0,
            ),
            child: Image.asset('assets/recommend_you_title.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            child: Text(
              '为你推荐',
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: 'PingFangBold',
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            height: 1.0,
            width: 66.0,
            color: Color(0xffFE823A),
          ),
        ],
      ),
    );
  }
}

List _items = [
];
