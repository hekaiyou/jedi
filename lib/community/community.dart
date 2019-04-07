import 'package:flutter/material.dart';
import 'package:jedi/community/daily_explosion.dart';

/// 自定义的社区页面组件。
class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

/// 与自定义的社区页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  /// 标签控制器（`TabController`）组件。
  TabController tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  List<String> tabs = [
    '每日爆款',
    '趣分享',
    '宣传素材',
    '花粉学堂',
  ];

  /// 标签栏视图（`TabBarView`）组件的配置项。
  List<Widget> views = [
    DailyExplosionPage(),
    Text('趣分享'),
    Text('宣传素材'),
    Text('花粉学堂'),
  ];

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

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
  void dispose() {
    // 标签控制器（`TabController`）组件的处理（`dispose`）方法，丢弃对象使用的所有资源。
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFFFFFF),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.0,
        // 标题间距（`titleSpacing`）属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/community_title.png'),
        ),
        bottom: PreferredSize(
          // 标签栏（`TabBar`）组件，显示一排水平的标签。
          child: TabBar(
            // 标签颜色（`labelColor`）属性，所选标签标签的颜色。
            labelColor: Color(0xff333333),
            // 未选定标签颜色（`unselectedLabelColor`）属性，未选定标签的颜色。
            unselectedLabelColor: Color(0xff333333),
            // 控制器（`controller`）属性，此组件的选择和动画状态。
            controller: tabController,
            // 标签（`tabs`）属性，通常是两个或多个标签组件的列表。
            tabs: tabs
                .map((String text) => Container(
                      height: 30.0,
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
            indicatorColor: Color(0xffFF7B52),
            // 指标大小（`indicatorSize`）属性，定义如何计算选定选项卡指示符的大小。
            indicatorSize: TabBarIndicatorSize.label,
            // 标签样式（`labelStyle`）属性，所选标签的文本样式。
            labelStyle: TextStyle(
              fontFamily: 'PingFangMedium',
              fontSize: 16.0,
            ),
            // 未选定标签样式（`labelStyle`）属性，未选中标签的文字样式。
            unselectedLabelStyle: TextStyle(
              fontFamily: 'PingFangRegular',
              fontSize: 14.0,
            ),
            // 标签填充（`labelPadding`）属性，填充添加到每个选项卡标签。
            labelPadding: EdgeInsets.only(
              left: 13.0,
              right: 7.0,
            ),
            // 指示填充（`indicatorPadding`）属性，显示在选项卡下方线条的水平填充。
            indicatorPadding: EdgeInsets.only(
              left: 29.0,
              right: 23.0,
            ),
          ),
          // 首选大小（`preferredSize`）属性，如果它不受限制，这个组件会更喜欢它的大小。
          preferredSize: Size.fromHeight(26.0),
        ),
      ),
      // 标签栏视图（`TabBarView`)组件，显示与当前所选选项卡对应的窗口组件的页面视图。
      body: TabBarView(
        // 控制器（`controller`）属性，此组件的选择和动画状态。
        controller: tabController,
        children: views,
      ),
    );
  }
}
