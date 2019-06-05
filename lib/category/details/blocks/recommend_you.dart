import 'package:flutter/material.dart';
import 'package:jedi/blocks/recommend_you_item.dart';

/// 自定义的为你推荐组件。
class RecommendYou extends StatefulWidget {
  @override
  _RecommendYouState createState() => _RecommendYouState();
}

/// 与自定义的为你推荐组件关联的状态子类。
class _RecommendYouState extends State<RecommendYou> {
  /// 每行可以显示的数量。
  final int rowNum = 2;

  @override
  Widget build(BuildContext context) {
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
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
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

    // 裂片列表（`SliverList`）组件，沿着主轴将多个盒子放置在线性阵列中的滚动条。
    return SliverList(
      // 委托（`delegate`）属性，为此组件提供子代的委托。
      // 裂片子代生成器委托（`SliverChildBuilderDelegate`）类，使用构建器回调提供子项的委托。
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: _rowList,
          );
        },
        // 子代总数（`childCount`）属性，该委托可以提供的子代总数。
        childCount: 1,
      ),
    );
  }
}

List _items = [
];
