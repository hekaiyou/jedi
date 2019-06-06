import 'package:flutter/material.dart';
import 'package:jedi/blocks/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

// 函数（`Function`）抽象类，所有函数类型的基类。
/// 用给定的处理函数（`handler`）处理给定的列表数据（`list`），返回处理结果列表（`result`）。
List<T> worker<T>(List list, Function handler) {
  // 列表变量，结果列表。
  List<T> result = [];
  // 列表的长度（`length`）属性，返回此列表中的对象数。
  for (var i = 0; i < list.length; i++) {
    // 列表的加（`add`）抽象方法，将值添加到此列表的末尾，将长度增加1。
    result.add(handler(i, list[i]));
  }
  return result;
}

/// 自定义的带指示器旋转木马滑块组件。
class CarouselWithIndicator extends StatefulWidget {
  /// 最终、字符串列表变量，图片列表，运营位图片列表。
  final List<List<String>> imgList;

  CarouselWithIndicator({
    this.imgList,
  });

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

/// 与自定义的带指示器旋转木马滑块组件关联的状态子类。
class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  /// 当前页面的索引。
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    // 垂直组件，用于在垂直布局中显示其子组件。
    return Stack(
      // 对准属性，如何将堆叠中未定位和部分定位的子项对齐。
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        // 自定义的旋转木马滑块（`CarouselSlider`）组件。
        CarouselSlider(
          // 使用自定义的工人`agent`方法生成一个容器组件列表。
          items: worker<Widget>(widget.imgList, (index, i) {
            // 容器组件，结合了常见的绘图、定位和大小调整的容器。
            return GestureDetector(
              child: Padding(
                padding: EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
                // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
                child: ClipRRect(
                  // 边界半径（`borderRadius`）属性，圆角的边界半径。
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  child: Container(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: i[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              onTap: () {
                print(i[1]);
                // 使用命名路由导航到第二个屏幕。
                Navigator.pushNamed(context, '/web/activity');
              },
            );
          }),
          autoPlay: widget.imgList.length > 1,
          autoPlayDuration: Duration(seconds: 1),
          interval: Duration(seconds: 5),
          viewportFraction: 1.0,
          aspectRatio: 23 / 9,
          distortion: false,
          updateCallback: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Align(
          // 对准属性，如何调整子组件。
          alignment: Alignment.bottomCenter,
          // 如果运营位图片列表只有一个图片，就不显示指示条。
          child: widget.imgList.length > 1
              // 行组件，用于在水平布局中显示其子组件。
              ? Row(
                  // 主轴对齐（`mainAxisAlignment`）组件，如何将孩子放在主轴上。
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imgList.map((value) {
                    return Container(
                      // 边缘（`margin`）属性，空白的空间环绕装饰和子组件。
                      margin: EdgeInsets.all(4.0),
                      // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
                      child: ClipOval(
                        child: Container(
                          color: value[0] == widget.imgList[_current][0]
                              ? Color(0xffFE7C30)
                              : Color(0xffFFFFFF),
                          height: 4.0,
                          width: 4.0,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
