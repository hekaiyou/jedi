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

/// 自定义的延展旋转木马滑块组件。
class CarouselExtensionSlider extends StatefulWidget {
  /// 最终、字符串列表变量，图片列表，运营位图片列表。
  final List<List<String>> imgList;

  CarouselExtensionSlider({
    this.imgList,
  });

  @override
  _CarouselExtensionSliderState createState() =>
      _CarouselExtensionSliderState();
}

/// 与自定义的延展旋转木马滑块组件关联的状态子类。
class _CarouselExtensionSliderState extends State<CarouselExtensionSlider> {
  @override
  Widget build(BuildContext context) {
    // 自定义的旋转木马滑块（`CarouselSlider`）组件。
    return CarouselSlider(
      // 使用自定义的工人`agent`方法生成一个容器组件列表。
      items: worker<Widget>(widget.imgList, (index, i) {
        // 容器组件，结合了常见的绘图、定位和大小调整的容器。
        return GestureDetector(
          // 卡片（`Card`）组件，有圆角和阴影的卡片。
          // 通常用于表示一些相关信息的一张卡片，例如相册、地理位置、用餐、联系方式等。
          child: Card(
            // 余量（`margin`）属性，卡片周围的空白区域。
            margin: EdgeInsets.symmetric(
              horizontal: 11.0,
              vertical: 3.0,
            ),
            // 剪辑行为（`clipBehavior`）属性，内容将被剪裁或不剪辑。
            clipBehavior: Clip.antiAlias,
            // 形状（`shape`）属性，卡片材质的形状。
            shape: RoundedRectangleBorder(
              // 边界半径（`borderRadius`）属性，每个角落的半径。
              borderRadius: BorderRadius.circular(12.0),
            ),
            // 海拔（`elevation`）属性，可以控制卡下方阴影大小的z坐标。
            elevation: 3.0,
            child: Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: i[0],
                fit: BoxFit.cover,
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
      viewportFraction: 0.85,
      aspectRatio: 19 / 9,
      distortion: false,
    );
  }
}
