import 'package:flutter/material.dart';
import 'package:jedi/my/fans/blocks/fan_meeting.dart';

/// 自定义的我的粉丝页面组件。
class FansPage extends StatefulWidget {
  @override
  _FansPageState createState() => _FansPageState();
}

/// 与自定义的我的粉丝页面组件关联的状态子类。
class _FansPageState extends State<FansPage>
    with SingleTickerProviderStateMixin {
  /// 标签控制器（`TabController`）组件。
  TabController tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  List<String> tabs = [
    '全部',
    '直邀',
    '推荐',
  ];

  /// 标签栏视图（`TabBarView`）组件的配置项。
  List<Widget> views = [
    FanMeeting(),
    FanMeeting(),
    FanMeeting(),
  ];

  @override
  void initState() {
    // 初始化标签控制器（`TabController`）组件。
    tabController = TabController(
      // 长度（`length`）属性，标签总数，通常大于1。
      length: tabs.length,
      // 参数为断续器提供者（`TickerProvider`）对象。
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 中心标题（`centerTitle`）属性，标题是否显示在应用栏中间。
        centerTitle: true,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: Color(0xffFFFFFF),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.0,
        // 标题（`title`）属性，应用栏的主要组件。
        title: Text(
          '粉丝',
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff000000),
            fontFamily: 'PingFangMedium',
          ),
        ),
        bottom: PreferredSize(
          child: Column(
            children: <Widget>[
              // 分隔（`Divider`）组件，2个像素高的水平线，两侧有填充。
              Divider(
                color: Color(0xffDDDDDD),
                height: 2.0,
              ),
              // 标签栏（`TabBar`）组件，显示一排水平的标签。
              TabBar(
                // 标签颜色（`labelColor`）属性，所选标签标签的颜色。
                labelColor: Color(0xffFE823A),
                // 未选定标签颜色（`unselectedLabelColor`）属性，未选定标签的颜色。
                unselectedLabelColor: Color(0xff666666),
                // 控制器（`controller`）属性，此组件的选择和动画状态。
                controller: tabController,
                // 标签（`tabs`）属性，通常是两个或多个标签组件的列表。
                tabs: tabs
                    .map((String text) => Container(
                          height: 44.0,
                          child: Center(
                            child: Text(
                              text,
                            ),
                          ),
                        ))
                    .toList(),
                // 是滚动（`isScrollable`）属性，此选项卡栏是否可以水平滚动。
                isScrollable: false,
                // 指示灯颜色（`indicatorColor`）属性，显示在所选选项卡下方的线条颜色。
                indicatorColor: Color(0xffFE823A),
                // 指标大小（`indicatorSize`）属性，定义如何计算选定选项卡指示符的大小。
                indicatorSize: TabBarIndicatorSize.label,
                // 标签样式（`labelStyle`）属性，所选标签的文本样式。
                labelStyle: TextStyle(
                  fontFamily: 'PingFangMedium',
                  fontSize: 15.0,
                ),
                // 未选定标签样式（`labelStyle`）属性，未选中标签的文字样式。
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'PingFangRegular',
                  fontSize: 15.0,
                ),
                // 标签填充（`labelPadding`）属性，填充添加到每个选项卡标签。
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                // 指示填充（`indicatorPadding`）属性，显示在选项卡下方线条的水平填充。
                indicatorPadding: EdgeInsets.symmetric(horizontal: 51.0),
              ),
              // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
              Divider(
                color: Color(0xffDDDDDD),
                height: 1.0,
              ),
            ],
          ),
          // 首选大小（`preferredSize`）属性，如果它不受限制，这个组件会更喜欢它的大小。
          preferredSize: Size.fromHeight(34.0),
        ),
      ),
      body: SafeArea(
        // 标签栏视图（`TabBarView`)组件，显示与当前所选选项卡对应的窗口组件的页面视图。
        child: TabBarView(
          // 控制器（`controller`）属性，此组件的选择和动画状态。
          controller: tabController,
          children: views,
        ),
      ),
    );
  }
}
