import 'package:flutter/material.dart';

/// 自定义的淘口令组件。
class AmoyPassword extends StatefulWidget {
  /// 上一个页面传递的淘口令。
  final String password;

  AmoyPassword({
    this.password,
  });

  @override
  _AmoyPasswordState createState() => _AmoyPasswordState();
}

/// 与自定义的淘口令组件关联的状态子类。
class _AmoyPasswordState extends State<AmoyPassword> {
  /// 页面的不透明度。
  double _opacity = 0.3;

  /// 自定义的搜索标题组件。
  Widget _searchTitle = Container(
    margin: EdgeInsets.all(6.0),
    child: Material(
      color: Color(0xffFFFFFF),
      child: Text(
        '猜你想找',
        style: TextStyle(
          fontSize: 19.0,
          fontFamily: 'PingFangMedium',
          color: Color(0xffFE7C30),
        ),
      ),
    ),
  );

  /// 自定义的搜索按钮组件。
  Widget _searchButton = GestureDetector(
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(6.0),
      height: 38.0,
      width: 110.0,
      decoration: BoxDecoration(
        color: Color(0xffFE7C30),
        // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
        // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
        border: Border.all(
          width: 1.0,
          // 如果是当前选择项，显示突出的边框颜色。
          color: Color(0xffFE7C30),
        ),
        // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
        // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
        // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
        // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: GestureDetector(
        child: Material(
          color: Color(0xffFE7C30),
          child: Text(
            '立刻搜索',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'PingFangRegular',
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    ),
  );

  /// 自定义的取消按钮组件。
  Widget _cancelButton = GestureDetector(
    child: Container(
      margin: EdgeInsets.all(6.0),
      alignment: Alignment.center,
      height: 38.0,
      width: 110.0,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
        // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
        border: Border.all(
          width: 1.0,
          // 如果是当前选择项，显示突出的边框颜色。
          color: Color(0xffFE7C30),
        ),
        // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
        // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
        // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
        // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: GestureDetector(
        child: Material(
          child: Text(
            '取消',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'PingFangRegular',
              color: Color(0xffFE7C30),
            ),
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: _opacity,
          child: GestureDetector(
            onTap: () {
              // 点击提醒页面时并返回。
              Navigator.of(context).pop(null);
            },
            child: Container(
              color: Colors.grey[900],
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                    // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                    // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                    // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                    borderRadius: BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _searchTitle,
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: 224.0,
                        child: Material(
                          color: Color(0xffFFFFFF),
                          child: Text(
                            widget.password,
                            // 溢出的文本以省略号（`...`）显示。
                            overflow: TextOverflow.ellipsis,
                            // 最大线（`maxLines`）属性，文本要跨越的可选最大行数，必要时包装。
                            // 如果文本超过给定的行数，则会根据溢出（`overflow`）将其截断。
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'PingFangRegular',
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          _cancelButton,
                          _searchButton,
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}
