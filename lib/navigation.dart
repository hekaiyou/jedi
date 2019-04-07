import 'package:flutter/material.dart';
import 'package:jedi/home/home.dart';
import 'package:jedi/category/category.dart';
import 'package:jedi/community/community.dart';
import 'package:jedi/earnings/earnings.dart';

/// 自定义的导航项目类，包含底部导航栏项目（`BottomNavigationBarItem`）组件需要的数据。
class NavigationItem {
  final String icon;
  final String activeIcon;
  final String title;

  NavigationItem({
    this.icon,
    this.activeIcon,
    this.title,
  });
}

/// 自定义的导航页面组件。
class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

/// 与自定义的导航页面组件关联的状态子类。
class _NavigationPageState extends State<NavigationPage> {
  /// 当前选择的索引。
  int _selectedIndex = 0;

  /// 页面控制器（`PageController`）组件，页面视图（`PageView`）的控制器。
  PageController _controller = PageController();

  /// 范型为自定义的导航项目类的列表，用于统一管理导航项目。
  List<NavigationItem> navigationItem = [
    NavigationItem(
      icon: 'assets/navigation_home.png',
      activeIcon: 'assets/navigation_home_selected.png',
      title: '首页',
    ),
    NavigationItem(
      icon: 'assets/navigation_classify.png',
      activeIcon: 'assets/navigation_classify_selected.png',
      title: '分类',
    ),
    NavigationItem(
      icon: 'assets/navigation_society.png',
      activeIcon: 'assets/navigation_society_selected.png',
      title: '社区',
    ),
    NavigationItem(
      icon: 'assets/navigation_earnings.png',
      activeIcon: 'assets/navigation_earnings_selected.png',
      title: '收益',
    ),
    NavigationItem(
      icon: 'assets/navigation_my.png',
      activeIcon: 'assets/navigation_my_selected.png',
      title: '我的',
    ),
  ];

  /// 底部导航栏的组件选项。
  final _widgetOptions = [
    HomePage(),
    CategoryPage(),
    CommunityPage(),
    EarningsPage(),
    Text('Index 4: 我的'),
  ];

  void _onItemTapped(int index) {
    // 创建底部导航栏的组件需要跟踪当前索引并调用`setState`以使用新提供的索引重建它。
    setState(() {
      _selectedIndex = index;
      // 跳到页面（`jumpToPage`）方法，更改显示在的页面视图（`PageView`）组件中页面。
      _controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 因为下面的代码无法避免页面被动重新绘制，所以不使用。
      body: Center(
        // 元素在（`elementAt`）方法，返回列表元素。
        child: _widgetOptions.elementAt(_selectedIndex),
      ), */
      // 页面视图（`PageView`）组件，可逐页工作的可滚动列表，每个子项都被强制与视窗大小相同。
      body: PageView.builder(
        // 物理（`physics`）属性，页面视图应如何响应用户输入。
        // 从不可滚动滚动物理（`NeverScrollableScrollPhysics`）类，不允许用户滚动。
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _widgetOptions.elementAt(index);
        },
        itemCount: _widgetOptions.length,
        // 控制器（`controller`）属性，用于控制滚动此页面视图位置的对象。
        controller: _controller,
      ),
      // 底部导航栏（`bottomNavigationBar`）属性，显示在脚手架（`Scaffold`）组件的底部。
      // 底部导航栏（`BottomNavigationBar`）组件，显示在应用程序底部的组件，
      // 用于在几个屏幕之间中进行选择，通常在三到五之间，再多就不好看了。
      bottomNavigationBar: BottomNavigationBar(
        // 项目（`items`）属性，位于底部导航栏中的交互组件，其中每一项都有一个图标和标题。
        items: navigationItem.map((NavigationItem navigationItem) {
          // 底部导航栏项目（`BottomNavigationBarItem`）组件，通常嵌入在底部导航组件中。
          return BottomNavigationBarItem(
            // 图标（`icon`）属性，项目的图标。
            icon: Image.asset(
              navigationItem.icon,
              height: 22,
            ),
            // 活动图标（`activeIcon`）属性，选择此底部导航项时显示的替代图标。
            activeIcon: Image.asset(
              navigationItem.activeIcon,
              height: 22,
            ),
            // 标题图标（`title`）属性，该项目的标题。
            title: Text(navigationItem.title),
          );
        }).toList(),
        // 目前的索引（`currentIndex`）属性，当前活动项的项目索引。
        currentIndex: _selectedIndex,
        // 固定颜色（`fixedColor`）属性，当BottomNavigationBarType.fixed时所选项目的颜色。
        fixedColor: Color(0xffFE7C30),
        // 在点击（`onTap`）属性，点击项目时调用的回调。
        onTap: _onItemTapped,
        // 定义底部导航栏（`BottomNavigationBar`）组件的布局和行为。
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
