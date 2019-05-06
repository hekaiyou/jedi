import 'package:flutter/material.dart';
import 'package:jedi/category/limited/blocks/appbar_title.dart';
import 'package:jedi/category/limited/blocks/appbar_bottom.dart';
import 'package:jedi/category/limited/blocks/limited_list.dart';

/// 自定义的限时抢购页面组件。
class LimitedPage extends StatefulWidget {
  @override
  _LimitedPageState createState() => _LimitedPageState();
}

/// 与自定义的限时抢购页面组件关联的状态子类。
class _LimitedPageState extends State<LimitedPage>
    with SingleTickerProviderStateMixin {
  /// 集中管理标签栏（`TabBar`）、标签栏视图（`TabBarView`）的配置项。
  final Map<String, Widget> tabViewKey = {
    '00:00/2': LimitedList(),
    '10:00/2': LimitedList(),
    '15:00/2': LimitedList(),
    '21:00/1': LimitedList(),
    '00:00/3': LimitedList(),
    '10:00/3': LimitedList(),
    '15:00/3': LimitedList(),
    '21:00/3': LimitedList(),
  };

  /// 标签控制器（`TabController`）组件，在标签栏（`TabBar`）和标签栏视图（`TabBarView`）组件之间协调选项卡选择。
  TabController _tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  List<String> tabs = [];

  /// 标签栏视图（`TabBarView`）组件的配置项。
  List<Widget> views = [];

  @override
  void initState() {
    // 将配置项列表的值赋予标签栏、标签栏视图和自定义的图片菜单配置列表。
    tabViewKey.forEach((String tab, Widget view) {
      tabs.add(tab);
      views.add(view);
    });
    // 初始化标签控制器（`TabController`）组件。
    _tabController = TabController(
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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 全局键值（`GlobalKey`）抽象类，整个应用程序中唯一的密钥。
    /// 当前全局键值（`GlobalKey`）对象用于应用栏（`AppBar`）组件。
    GlobalKey _appBarKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFF6555),
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.0,
        // 标题间距（`titleSpacing`）属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: AppBarTitle(),
        // 设置应用栏是否需要显示前置组件，就是系统默认的返回按钮。
        automaticallyImplyLeading: false,
        // 底部（`bottom`）属性，此组件显示在应用栏的底部。
        // 首选大小（`PreferredSize`）组件，具有首选大小，它不会对其子项施加任何约束，也不会以任何方式影响子项的布局。
        // 它只是宣传了父级组件可以使用的首选大小。
        bottom: PreferredSize(
          child: AppBarBottom(
            tabController: _tabController,
            tabs: tabs,
          ),
          // 首选大小（`preferredSize`）属性，如果它不受限制，这个组件会更喜欢它的大小。
          preferredSize: Size.fromHeight(62.0),
        ),
      ),
      // 标签栏视图（`TabBarView`)组件，显示与当前所选选项卡对应的窗口组件的页面视图。
      body: TabBarView(
        // 控制器（`controller`）属性，此组件的选择和动画状态。
        controller: _tabController,
        children: views,
      ),
    );
  }
}
