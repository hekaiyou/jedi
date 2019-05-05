import 'package:flutter/material.dart';

/// 自定义的应用栏底部组件。
class AppBarBottom extends StatefulWidget {
  /// 标签控制器（`TabController`）组件。
  final TabController tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  final List<String> tabs;

  AppBarBottom({
    this.tabController,
    this.tabs,
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
        image: DecorationImage(
          image: AssetImage('assets/limited_bar_plate_2.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          // 在顶部部占个位置。
          SizedBox(height: 5.0),
          TabBar(
            // 标签颜色（`labelColor`）属性，所选标签标签的颜色。
            labelColor: Color(0xffFF3358),
            // 未选定标签颜色（`unselectedLabelColor`）属性，未选定标签的颜色。
            unselectedLabelColor: Color(0xffE0E0E0),
            // 控制器（`controller`）属性，此组件的选择和动画状态。
            controller: widget.tabController,
            // 标签（`tabs`）属性，通常是两个或多个标签组件的列表。
            tabs: widget.tabs
                .map((String text) => Container(
                      // 装饰（`decoration`）属性，子组件背后的装饰。
                      // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                      decoration: BoxDecoration(
                        // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                        // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                        // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                        borderRadius: BorderRadius.all(
                          // 半径（`Radius`）类，圆形或椭圆形的半径。
                          // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                          Radius.circular(3.0),
                        ),
                      ),
                      height: 54.0,
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            text.split('/')[0],
                            style: TextStyle(
                              fontFamily: 'PingFangMedium',
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '即将开始',
                            style: TextStyle(
                              fontFamily: 'PingFangRegular',
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            // 是滚动（`isScrollable`）属性，此选项卡栏是否可以水平滚动。
            isScrollable: true,
            // 指标大小（`indicatorSize`）属性，定义如何计算选定选项卡指示符的大小。
            indicatorSize: TabBarIndicatorSize.label,
            // 标签填充（`labelPadding`）属性，填充添加到每个选项卡标签。
            labelPadding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            // 指示符（`indicator`）属性，定义所选选项卡指示器的外观。
            indicator: BoxDecoration(
              color: const Color(0xffFFFFFF),
              // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
              // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
              // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
              borderRadius: BorderRadius.all(
                // 半径（`Radius`）类，圆形或椭圆形的半径。
                // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                Radius.circular(3.0),
              ),
            ),
          ),
          // 在底部占个位置。
          SizedBox(height: 13.0),
        ],
      ),
    );
  }
}
