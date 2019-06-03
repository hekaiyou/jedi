import 'package:flutter/material.dart';
import 'package:jedi/home/classification/blocks/classification_list_tile.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/blocks/recommend_you_item.dart';

/// 自定义的根据用户选择风格组件。
List<Widget> processingSortingStyle({int stype, List<dynamic> hotMaps}) {
  List<Widget> widgetList = [];
  // 如果用户选择风格为0时的处理方式。
  if (stype == 0) {
    for (Map _hotMap in hotMaps) {
      widgetList.add(ClassificationListTile(
        // itemId: _hotMap['itemId'],
        // isselfupport: _hotMap['isselfupport'],
        picturl: _hotMap['isselfupport'] == "2"
            ? _hotMap['pictUrl']
            : imageurlHeadGoodsgroups + _hotMap['pictUrl'],
        // shortTitle: _hotMap['shortTitle'],
        // couponAmount: _hotMap['couponAmount'],
        // zkFinalPrice: _hotMap['zkFinalPrice'],
        // couponTotalCount: _hotMap['couponTotalCount'],
        // couponRemainCount: _hotMap['couponRemainCount'],
        // shopTitle: _hotMap['shopTitle'],
        // smallImages: _hotMap['smallImages'],
        title: _hotMap['title'],
        // couponShareUrl: _hotMap['couponShareUrl'],
      ));
    }
    // 如果用户选择风格为1或其他时的处理方式。
  } else {
    // 每行可以显示的数量。
    int rowNum = 2;
    // 当前行已经有多少组件。
    int _row = 0;
    // 包装在灵活（`Flexible`）组件里的容器（`Container`）组件列表。
    // 临时存储当前行的数据，最大行数满了就清理一次。
    List<Flexible> _columnList = [];
    for (Map _hotMap in hotMaps) {
      _columnList.add(
        // 控制行（`Row`）、列（`Column`）或柔性（`Flex`）的子项如何灵活放置的组件。
        Flexible(
          // 柔性（`flex`）属性，用于这个子组件的弹性因子。
          flex: 1,
          child: RecommendYouItem(
            row: _row,
            recommendItem: RecommendItem(
              title: _hotMap['title'],
              objUrl: _hotMap['isselfupport'] == "2"
                  ? _hotMap['pictUrl']
                  : imageurlHeadGoodsgroups + _hotMap['pictUrl'],
              rebatePrice: double.parse(_hotMap['zkFinalPrice']) -
                  double.parse(_hotMap['couponAmount']),
              costPrice: double.parse(_hotMap['zkFinalPrice']),
              couponPrice: double.parse(_hotMap['couponAmount']),
              earnSum: 10.0,
              purchaseNum:
                  _hotMap['couponTotalCount'] - _hotMap['couponRemainCount'],
            ),
          ),
        ),
      );
      // 当前行数执行自加操作。
      _row++;
      // 当前行数等于每行最大可以显示的数量时，将数据添加进返回的数据列表，同时清理临时数据列表。
      if (_row == rowNum) {
        widgetList.add(
          Container(
            margin: EdgeInsets.only(
              top: 6.0,
              left: 13.0,
              right: 13.0,
              bottom: 6.0,
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
  }
  return widgetList;
}
