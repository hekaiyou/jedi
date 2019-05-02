import 'package:flutter/material.dart';

/// 自定义的为你推荐标题组件。
class RecommendYouTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 裂片固定范围列表（`SliverFixedExtentList`）组件，
    // 将多个具有相同主轴范围的盒子放置在线性阵列中的滚动条，裂片应用栏（`SliverAppBar`）组件的子项。
    return SliverFixedExtentList(
      // 项目范围（`itemExtent`）属性，子组件被迫在主轴上受到的高度限制。
      itemExtent: 80.0,
      // 委托（`delegate`）属性，为此组件提供子代的委托。
      // 裂片子代生成器代表（`SliverChildBuilderDelegate`）组件，使用构建器回调提供子项的委托。
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 80.0,
            color: Color(0xffFFFFFF),
            margin: EdgeInsets.only(
              top: 10.0,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 一个橙色的装饰条。
                Container(
                  height: 1.0,
                  width: 66.0,
                  color: Color(0xffFE823A),
                ),
                // “为你推荐”的图标。
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 4.0,
                  ),
                  child: Image.asset('assets/recommend_you_title.png'),
                ),
                // “为你推荐”的文本。
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
                // 一个橙色的装饰条。
                Container(
                  height: 1.0,
                  width: 66.0,
                  color: Color(0xffFE823A),
                ),
              ],
            ),
          );
        },
        // 子代总数（`childCount`）属性，该委托可以提供的子代总数。
        childCount: 1,
      ),
    );
  }
}
