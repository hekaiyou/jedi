import 'package:flutter/material.dart';

/// 自定义的图片菜单组件。
class ImageMenu extends StatefulWidget {
  /// 提醒文本。
  final double hight;

  /// 每个可选择标签对应的文本内容列表。
  final List<String> tabs;

  /// 每个可选择标签对应的图片组件列表。
  final List<Widget> images;

  /// 接收到当前选择的标签下标。
  final int select;

  ImageMenu({
    @required this.hight,
    this.tabs,
    this.images,
    this.select,
  });

  @override
  _ImageMenuState createState() => _ImageMenuState();
}

/// 与自定义的顶部提醒组件关联的状态子类。
class _ImageMenuState extends State<ImageMenu> {
  /// 每行可选择标签对应的组件列表。
  List<Widget> _imageColumn;

  /// 当前选择的标签下标。
  int _select;

  @override
  void initState() {
    _select = widget.select;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 当前行中已经有多少个组件。
    int connx = 0;
    // 每次构建之前清理一次每行组件列表，避免重复内容。
    _imageColumn = [];
    // 临时存储当前行的所有子组件列表。
    List<Widget> _imageRow = [];
    // 遍历每个可选择标签对应的图片组件。
    for (int i = 0; i < widget.images.length; i++) {
      _imageRow.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: 13.0,
              right: 13.0,
              bottom: 13.0,
            ),
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  widget.images[i],
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    widget.tabs[i],
                    style: TextStyle(
                      // 如果是当前用户选择的标签，显示不同颜色。
                      color: _select == i ? Colors.red : Colors.grey[900],
                      // 如果是当前用户选择的标签，显示不同字体大小。
                      fontSize: _select == i ? 14.0 : 13.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  _select = i;
                });
                Navigator.of(context).pop(_select);
              },
            ),
          ),
        ),
      );
      // 当前行中的组件数量执行自加操作。
      connx++;
      // 如果当前行列表中已经有4个组件，归档并清理列表数据。
      if (connx == 4) {
        connx = 0;
        _imageColumn.add(Row(
          children: _imageRow,
        ));
        _imageRow = [];
      }
    }

    return Column(
      children: <Widget>[
        GestureDetector(
          child: Opacity(
            opacity: 0.0,
            child: Container(
              height: widget.hight,
              color: Colors.grey[900],
            ),
          ),
          onTap: () {
            // 点击提醒页面时并返回。
            Navigator.of(context).pop(null);
          },
        ),
        Container(
          // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          color: Colors.grey[50],
          child: Material(
            color: Colors.grey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '更多频道',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: _imageColumn,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Opacity(
              opacity: 0.2,
              child: Container(
                color: Colors.grey[900],
              ),
            ),
            onTap: () {
              // 点击提醒页面时并返回。
              Navigator.of(context).pop(null);
            },
          ),
        ),
      ],
    );
  }
}
