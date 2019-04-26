import 'package:flutter/material.dart';
import 'package:jedi/my/order/blocks/my_order.dart';
import 'package:jedi/my/order/blocks/subordinate_order.dart';

/// 自定义的我的订单页面组件。
class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

/// 与自定义的我的订单页面组件关联的状态子类。
class _OrderPageState extends State<OrderPage> {
  /// 当前选择的索引。
  int _selectedIndex = 0;

  /// 页面控制器（`PageController`）组件，页面视图（`PageView`）的控制器。
  PageController _controller = PageController();

  /// 底部导航栏的组件选项。
  final _widgetOptions = [
    MyOrder(),
    SubordinateOrder(),
  ];

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
        elevation: 1.0,
        // 标题（`title`）属性，应用栏的主要组件。
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _onItemTapped(0);
              },
              child: Container(
                height: 29.0,
                width: 78.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // 根据当前选择的索引改变背景图片。
                    image: _selectedIndex == 0
                        ? AssetImage('assets/choose_my_order.png')
                        : AssetImage('assets/white_placeholder.png'),
                    fit: BoxFit.fill,
                  ),
                  // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                  // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                  // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                  // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                  borderRadius: BorderRadius.horizontal(
                    // 半径（`Radius`）类，圆形或椭圆形的半径。
                    // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                    left: Radius.circular(23.0),
                  ),
                  // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                  // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
                  border: Border.all(
                    // 根据当前选择的索引改变边框大小。
                    width: _selectedIndex == 0 ? 0.0 : 1.0,
                    // 根据当前选择的索引改变边框颜色。
                    color: _selectedIndex == 0
                        ? Color(0xffFFFFFF)
                        : Color(0xffFFB386),
                  ),
                ),
                child: Text(
                  '我的订单',
                  style: TextStyle(
                    // 根据当前选择的索引改变字体颜色值。
                    color: _selectedIndex == 0
                        ? Color(0xffF9F9F9)
                        : Color(0xff333333),
                    // 根据当前选择的索引改变字体。
                    fontFamily: _selectedIndex == 0
                        ? 'PingFangMedium'
                        : 'PingFangRegular',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(1);
              },
              child: Container(
                height: 29.0,
                width: 78.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // 根据当前选择的索引改变背景图片。
                    image: _selectedIndex == 1
                        ? AssetImage('assets/choose_subordinate_order.png')
                        : AssetImage('assets/white_placeholder.png'),
                    fit: BoxFit.fill,
                  ),
                  // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                  // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                  // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                  // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                  borderRadius: BorderRadius.horizontal(
                    // 半径（`Radius`）类，圆形或椭圆形的半径。
                    // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                    right: Radius.circular(23.0),
                  ),
                  // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                  // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
                  border: Border.all(
                    // 根据当前选择的索引改变边框大小。
                    width: _selectedIndex == 1 ? 0.0 : 1.0,
                    // 根据当前选择的索引改变边框颜色。
                    color: _selectedIndex == 1
                        ? Color(0xffFFFFFF)
                        : Color(0xffFE813A),
                  ),
                ),
                child: Text(
                  '下级订单',
                  style: TextStyle(
                    // 根据当前选择的索引改变字体颜色值。
                    color: _selectedIndex == 1
                        ? Color(0xffF9F9F9)
                        : Color(0xff333333),
                    // 根据当前选择的索引改变字体。
                    fontFamily: _selectedIndex == 1
                        ? 'PingFangMedium'
                        : 'PingFangRegular',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        // 在应用栏后面放一个日期的图标按钮（`IconButton`）组件，占一个位置，使标题行两边对称。
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.date_range,
              // 按钮设置成白色，起到隐藏的效果。
              color: Color(0xffFFFFFF),
            ),
          ),
        ],
      ),
      body: SafeArea(
        // 页面视图（`PageView`）组件，��逐页工作的可滚动列表，每个子项都被强制与视窗大小相同。
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
    );
  }
}
