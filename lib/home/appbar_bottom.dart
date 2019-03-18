import 'package:flutter/material.dart';

/// 自定义的应用栏底部组件。
class AppBarBottom extends StatefulWidget {
  /// 标签控制器（`TabController`）组件。
  final TabController tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  final List<String> tabs;

  /// 用户选择更多时的回调函数。
  final VoidCallback onTapCallback;

  AppBarBottom({
    this.tabController,
    this.tabs,
    this.onTapCallback,
  });

  @override
  _AppBarBottomState createState() => _AppBarBottomState();
}

/// 与自定义的应用栏底部组件关联的状态子类。
class _AppBarBottomState extends State<AppBarBottom> {
  @override
  Widget build(BuildContext context) {
    // 装饰盒（`DecoratedBox`）组件，在子组件绘画之前或之后绘制装饰的组件，
    return DecoratedBox(
      // 装饰（`decoration`）属性，具体怎么画装饰。
      decoration: BoxDecoration(
          // 线性梯度（`gradient`）组件，2D线性渐变。
          gradient: LinearGradient(
        // 开始（`begin`）属性，放置渐变的0.0的偏移量。
        begin: Alignment.topRight,
        // 颜色（`colors`）属性，梯度应在每个停靠点处获得的颜色。
        colors: <Color>[
          const Color(0xffFF3F70),
          const Color(0xffFF3A66),
          const Color(0xffFF3963),
          const Color(0xffFF375F),
          const Color(0xffFF355B),
        ],
      )),
      child: Row(
        children: <Widget>[
          // 扩展（`Expanded`）组件，用于展开行（`Row`）、列（`Column`）或柔性（`Flex`）的子项。
          Expanded(
            // 标签栏（`TabBar`）组件，显示一排水平的标签。
            child: TabBar(
              // 标签颜色（`labelColor`）属性，所选标签标签的颜色。
              labelColor: Color(0xffFFFFFF),
              // 未选定标签颜色（`unselectedLabelColor`）属性，未选定标签的颜色。
              unselectedLabelColor: Color(0xffFFFFFF),
              // 控制器（`controller`）属性，此组件的选择和动画状态。
              controller: widget.tabController,
              // 标签（`tabs`）属性，通常是两个或多个标签组件的列表。
              tabs: widget.tabs
                  .map((String text) => Container(
                        height: 27.0,
                        child: Center(
                          child: Text(
                            text,
                          ),
                        ),
                      ))
                  .toList(),
              // 是滚动（`isScrollable`）属性，此选项卡栏是否可以水平滚动。
              isScrollable: true,
              // 指示灯颜色（`indicatorColor`）属性，显示在所选选项卡下方的线条颜色。
              indicatorColor: Color(0xffFFFFFF),
              // 指标大小（`indicatorSize`）属性，定义如何计算选定选项卡指示符的大小。
              indicatorSize: TabBarIndicatorSize.label,
              // 标签样式（`labelStyle`）属性，所选标签的文本样式。
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              // 未选定标签样式（`labelStyle`）属性，未选中标签的文字样式。
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
              ),
              // 标签填充（`labelPadding`）属性，填充添加到每个选项卡标签。
              labelPadding: EdgeInsets.symmetric(
                horizontal: 11.0,
              ),
            ),
          ),
          // 手势探测器（`GestureDetector`）组件，检测手势的组件。
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13.0,
              ),
              child: Image.asset(
                'assets/app_bar_more.png',
                height: 12,
                width: 12,
              ),
            ),
            // 在点击（`onTap`）熟悉，已经发生了点击时触发。
            onTap: () async {
              widget.onTapCallback();
            },
          ),
        ],
      ),
    );
  }
}
