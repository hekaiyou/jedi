import 'package:flutter/material.dart';
import 'package:jedi/earnings/blocks/income_summary.dart';
import 'package:jedi/earnings/blocks/online_income.dart';

/// 自定义的收益页面组件。
class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

/// 与自定义的收益页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _EarningsPageState extends State<EarningsPage>
    with AutomaticKeepAliveClientMixin {
  /// 当前选择的索引。
  int _selectedIndex = 0;

  /// 页面控制器（`PageController`）组件，页面视图（`PageView`）的控制器。
  PageController _controller = PageController();

  /// 底部导航栏的组件选项。
  final _widgetOptions = [
    OnlineIncome(),
    Text('Index 1: 线下收益'),
  ];

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 跳到页面（`jumpToPage`）方法，更改显示在的页面视图（`PageView`）组件中页面。
      _controller.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            // 媒体查询数据（`MediaQueryData`）类的大小（`size`）属性，逻辑像素中的媒体大小，即屏幕的大小。
            // 媒体查询数据（`MediaQueryData`）类的填充（`padding`）属性，应用程序可以呈现的显示矩形每一侧的物理像素数。
            // 填充（`padding`）属性的顶部（`top`）值是状态栏高度，底部（`bottom`）值是系统操作栏高度。
            height: MediaQuery.of(context).padding.top < 18
                ? 235.0 + MediaQuery.of(context).padding.top
                : 235.0 + MediaQuery.of(context).padding.top - 18,
            child: Stack(
              children: <Widget>[
                IncomeSummary(),
                Align(
                  // 靠底部中间对齐。
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        // 半径（`Radius`）类，圆形或椭圆形的半径。
                        // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                        right: Radius.circular(23.0),
                        left: Radius.circular(23.0),
                      ),
                      // 阴影
                      boxShadow: [
                        BoxShadow(
                          //阴影位置
                          offset: Offset(0.0, 2.0),
                          // 阴影颜色。
                          color: Color.fromRGBO(0, 0, 0, 0.11),
                          // 阴影模糊程度，大就更透明更扩散
                          blurRadius: 6.0,
                          // 阴影模糊大小， 负的 缩小 正的 增大
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    height: 45.0,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _onItemTapped(0);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // 根据当前选择的索引改变颜色值。
                                color: _selectedIndex == 0
                                    ? Color(0xffFFECE0)
                                    : Color(0xffFFFFFF),
                                // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                                // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                                // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                                // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                                borderRadius: BorderRadius.horizontal(
                                  // 半径（`Radius`）类，圆形或椭圆形的半径。
                                  // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                                  left: Radius.circular(23.0),
                                ),
                              ),
                              child: Text(
                                '线上收益',
                                style: TextStyle(
                                  // 根据当前选择的索引改变颜色值。
                                  color: _selectedIndex == 0
                                      ? Color(0xffFE7C30)
                                      : Color(0xff333333),
                                  // 根据当前选择的索引改变字体。
                                  fontFamily: _selectedIndex == 0
                                      ? 'PingFangMedium'
                                      : 'PingFangRegular',
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              _onItemTapped(1);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // 根据当前选择的索引改变颜色值。
                                color: _selectedIndex == 1
                                    ? Color(0xffFFECE0)
                                    : Color(0xffFFFFFF),
                                // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                                // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                                // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                                // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                                borderRadius: BorderRadius.horizontal(
                                  // 半径（`Radius`）类，圆形或椭圆形的半径。
                                  // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                                  right: Radius.circular(23.0),
                                ),
                              ),
                              child: Text(
                                '线下收益',
                                style: TextStyle(
                                  // 根据当前选择的索引改变颜色值。
                                  color: _selectedIndex == 1
                                      ? Color(0xffFE7C30)
                                      : Color(0xff333333),
                                  // 根据当前选择的索引改变字体。
                                  fontFamily: _selectedIndex == 1
                                      ? 'PingFangMedium'
                                      : 'PingFangRegular',
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // 页面视图（`PageView`）组件，可逐页工作的可滚动列表，每个子项都被强制与视窗大小相同。
            child: PageView.builder(
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
          ),
        ],
      ),
    );
  }
}
