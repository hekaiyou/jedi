import 'package:flutter/material.dart';
import 'package:jedi/home/image_menu.dart';
import 'package:jedi/home/appbar_title.dart';
import 'package:jedi/home/appbar_bottom.dart';
import 'package:jedi/home/featured/featured.dart';

/// 自定义的主页面组件。
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// 与自定义的主页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  /// 集中管理标签栏（`TabBar`）、标签栏视图（`TabBarView`）和自定义的图片菜单组件的配置项。
  final Map<String, List<Widget>> tabViewKey = {
    '精选': [
      FeaturedPage(),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '猜你喜欢': [
      Text('猜你喜欢'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '母婴': [
      Text('母婴'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '食品': [
      Text('食品'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '女装': [
      Text('女装'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '彩妆': [
      Text('彩妆'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '洗护': [
      Text('洗护'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '内衣': [
      Text('内衣'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '百货': [
      Text('百货'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '家电': [
      Text('家电'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '家居': [
      Text('家居'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
    '数码': [
      Text('数码'),
      Image.network(
          'http://pic.sc.chinaz.com/files/pic/pic9/201903/hpic706.jpg')
    ],
  };

  /// 标签控制器（`TabController`）组件，在标签栏（`TabBar`）和标签栏视图（`TabBarView`）组件之间协调选项卡选择。
  TabController _tabController;

  /// 标签栏（`TabBar`）组件的配置项。
  List<String> tabs = [];

  /// 标签栏视图（`TabBarView`）组件的配置项。
  List<Widget> views = [];

  /// 自定义的图片菜单（`ImageMenu`）组件的配置项。
  List<Widget> images = [];

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // 将配置项列表的值赋予标签栏、标签栏视图和自定义的图片菜单配置列表。
    tabViewKey.forEach((String tab, List<Widget> view) {
      tabs.add(tab);
      views.add(view[0]);
      images.add(view[1]);
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

  /// 打开自定义的图片菜单组件。
  void openImageMenu(context, double hight, List<String> tabs,
      List<Widget> images, int select) {
    // 导航器（`Navigator`）组件，用于管理具有堆栈规则的一组子组件。
    // 许多应用程序在其窗口组件层次结构的顶部附近有一个导航器，以便使用叠加显示其逻辑历史记录，
    // 最近访问过的页面可视化地显示在旧页面之上。使用此模式，
    // 导航器可以通过在叠加层中移动组件来直观地从一个页面转换到另一个页面。
    // 类似地，导航器可用于通过将对话框窗口组件放置在当前页面上方来显示对话框。
    // 导航器（`Navigator`）组件的关于（`of`）方法，来自此类的最近实例的状态，它包含给定的上下文。
    // 导航器（`Navigator`）组件的推（`push`）方法，将给定路径推送到最紧密包围给定上下文的导航器。
    Navigator.of(context)
        .push(
      // 页面路由生成器（`PageRouteBuilder`）组件，用于根据回调定义一次性页面路由的实用程序类。
      PageRouteBuilder(
          // 转换完成后路由是否会遮盖以前的路由。
          opaque: false,
          // 页面构建器（`pageBuilder`）属性，用于构建路径的主要内容。
          pageBuilder: (BuildContext context, _, __) {
            return ImageMenu(
              hight: hight,
              tabs: tabs,
              images: images,
              select: select,
            );
          },
          // 转换生成器（`transitionsBuilder`）属性，用于构建路径的转换。
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            // 淡出过渡（`FadeTransition`）组件，动画组件的不透明度。
            // https://docs.flutter.io/flutter/widgets/FadeTransition-class.html
            return FadeTransition(
              // 不透明度（`opacity`）属性，控制子组件不透明度的动画。
              opacity: animation,
              // 滑动过渡（`SlideTransition`）组件，动画组件相对于其正常位置的位置。
              // https://docs.flutter.io/flutter/widgets/SlideTransition-class.html
              child: SlideTransition(
                // 位置（`position`）属性，控制子组件位置的动画。
                // 两者之间（`Tween`）类，开始值和结束值之间的线性插值。
                // 偏移（`Offset`）类，不可变的2D浮点偏移量。
                position: Tween<Offset>(
                  // 两者之间（`Tween`）类的开始（`begin`）属性，此变量在动画开头的值。
                  begin: Offset(0.0, -0.1),
                  // 两者之间（`Tween`）类的结束（`end`）属性，此变量在动画结束时的值。
                  end: Offset.zero,
                  // 两者之间（`Tween`）类的活跃（`animate`）方法，返回由给定动画驱动但接受由此对象确定的值的新动画。
                ).animate(animation),
                child: child,
              ),
            );
          }),
    )
        .then((value) {
      // 如果自定义的图片菜单组件返回不为空时，更新
      if (value != null) {
        setState(() {
          // 通过标签控制器（`TabController`）组件切换标签页。
          _tabController.index = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// 全局键值（`GlobalKey`）抽象类，整个应用程序中唯一的密钥。
    /// 当前全局键值（`GlobalKey`）对象用于应用栏（`AppBar`）组件。
    GlobalKey _appBarKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFF447C),
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.0,
        // 标题间距（`titleSpacing`��属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: AppBarTitle(),
        // 底部（`bottom`）属性，此组件显示在应用栏的底部。
        // 首选大小（`PreferredSize`）组件，具有首选大小，它不会对其子项施加任何约束，也不会以任何方式影响子项的布局。
        // 它只是宣传了父级组件可以使用的首选大小。
        bottom: PreferredSize(
          child: AppBarBottom(
            tabController: _tabController,
            tabs: tabs,
            onTapCallback: () {
              openImageMenu(context, _appBarKey.currentContext.size.height,
                  tabs, images, _tabController.index);
            },
          ),
          // 首选大小（`preferredSize`）属性，如果它不受限制，这个组件会更喜欢它的大小。
          preferredSize: Size.fromHeight(30.0),
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
