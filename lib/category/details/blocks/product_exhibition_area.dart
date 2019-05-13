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

/// 自定义的商品展示区组件。
class ProductExhibitionArea extends StatefulWidget {
  /// 最终、字符串列表变量，图片列表，商品图片列表。
  final List<dynamic> imgList;

  /// 最终、字符串变量，图片地址的头部。
  final String imageurlHead;

  /// 最终、双精度变量，券后价。
  final double zkfinalprice;

  ProductExhibitionArea({
    this.imgList,
    this.imageurlHead,
    this.zkfinalprice,
  });

  @override
  _ProductExhibitionAreaState createState() => _ProductExhibitionAreaState();
}

/// 与自定义的商品展示区组件关联的状态子类。
class _ProductExhibitionAreaState extends State<ProductExhibitionArea> {
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
              child: CachedNetworkImage(
                imageUrl: widget.imageurlHead + i,
                // 适应属性，如何在框里展示图像。
                // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                fit: BoxFit.cover,
              ),
              onTap: () {},
            );
          }),
          autoPlay: widget.imgList.length > 1,
          autoPlayDuration: Duration(seconds: 1),
          interval: Duration(seconds: 5),
          viewportFraction: 1.0,
          aspectRatio: 1 / 1,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 容器组件，结合了常见的绘图、定位和大小调整的容器。
                    Container(
                      height: 42.0,
                      width: 154.0,
                      alignment: Alignment.center,
                      // 装饰（`decoration`）属性，子组件背后的装饰。
                      // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                      decoration: BoxDecoration(
                        // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                        // 装饰图片（`DecorationImage`）类，框装饰的图像。
                        image: DecorationImage(
                          // 装饰图片（`DecorationImage`）类的图片（`image`）属性，将图像绘制成装饰。
                          // 通常通过资产图片（`AssetImage`）使用随应用程序一起提供的图像，
                          // 或通过网络图像（`NetworkImage`）使用从网络获取的图像。
                          image: AssetImage(
                              'assets/details_discount_gradient.png'),
                          // 适应属性，如何在框里展示图像。
                          // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                          fit: BoxFit.fill,
                        ),
                      ),
                      // 显示商品券后价的文本（`Text`）组件。
                      child: Text(
                        // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
                        '券后价：￥' + widget.zkfinalprice.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangMedium',
                        ),
                      ),
                    ),
                    // 容器组件，结合了常见的绘图、定位和大小调整的容器。
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8.0,
                      ),
                      height: 22.0,
                      width: 37.0,
                      alignment: Alignment.center,
                      // 装饰（`decoration`）属性，子组件背后的装饰。
                      // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                        // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                        // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                        borderRadius: BorderRadius.all(
                          // 半径（`Radius`）类，圆形或椭圆形的半径。
                          // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                          Radius.circular(12.0),
                        ),
                      ),
                      // 显示当前图片索引与最大图片索引的文本（`Text`）组件。
                      child: Text(
                        (_current + 1).toString() +
                            '/' +
                            widget.imgList.length.toString(),
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangRegular',
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
