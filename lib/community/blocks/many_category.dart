import 'package:flutter/material.dart';
import 'package:jedi/community/blocks/single_category.dart';

/// 自定义的多分类页面组件。
class ManyCategoryPage extends StatefulWidget {
  final List<dynamic> outBbsCategoryList;

  ManyCategoryPage({
    this.outBbsCategoryList,
  });

  @override
  _ManyCategoryPageState createState() => _ManyCategoryPageState();
}

/// 与自定义的多分类页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的标签栏视图（`TabBarView`）组件切换时被重新绘制。
class _ManyCategoryPageState extends State<ManyCategoryPage>
    with AutomaticKeepAliveClientMixin {
  /// 当前选择的索引。
  int _selectedIndex = 0;

  /// 页面控制器（`PageController`）组件，页面视图（`PageView`）的控制器。
  PageController _controller = PageController();

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @protected
  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 跳到页面（`jumpToPage`）方法，更改显示在的页面视图（`PageView`）组件中页面。
      _controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> _widgetOptions = [];
    List<Widget> _label = [];
    for (int i = 0; i < widget.outBbsCategoryList.length; i++) {
      Map _map = widget.outBbsCategoryList[i];
      BorderRadius _radius;
      if (widget.outBbsCategoryList[0]['categoryname'] ==
          _map['categoryname']) {
        _radius = BorderRadius.horizontal(
          left: Radius.circular(6.0),
        );
      } else if (widget.outBbsCategoryList[widget.outBbsCategoryList.length - 1]
              ['categoryname'] ==
          _map['categoryname']) {
        _radius = BorderRadius.horizontal(
          right: Radius.circular(6.0),
        );
      } else {
        _radius = BorderRadius.all(Radius.circular(0.0));
      }
      _label.add(
        GestureDetector(
          onTap: () {
            _onItemTapped(i);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 9.0),
            padding: EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 16.0,
            ),
            // 装饰（`decoration`）属性，具体怎么画装饰。
            decoration: BoxDecoration(
              color:
                  _selectedIndex == i ? Color(0xffFE7C30) : Color(0xffFFFFFF),
              border: Border.all(
                color:
                    _selectedIndex == i ? Color(0xffFE7C30) : Color(0xffDDDDDD),
                width: 1.0,
              ),
              // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
              // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
              // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
              // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
              borderRadius: _radius,
            ),
            child: Text(
              _map['categoryname'],
              style: TextStyle(
                color:
                    _selectedIndex == i ? Color(0xffFFFFFF) : Color(0xff333333),
                fontFamily: 'PingFangRegular',
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      );
      _widgetOptions.add(SingleCategoryPage(id: _map['id']));
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _label,
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
