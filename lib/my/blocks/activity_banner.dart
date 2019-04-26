import 'package:flutter/material.dart';
import 'package:jedi/blocks/carousel_slider.dart';

/// 最终、字符串列表变量，图片列表，运营位图片列表。
final List<String> imgList = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552850106279&di=66945cb570b8b229ef2cd44439f29191&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170916%2Fa941249e25e8495e81ff845b53a0a631.gif',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552849040492&di=466f5b51f52223e7855a60c522f9caed&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F51%2F77%2F175ae675f513899.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552848913675&di=27dcd7c44c7f26207b62f77cb1bd3c0d&imgtype=0&src=http%3A%2F%2Fpic.90sjimg.com%2Fdesign%2F00%2F66%2F06%2F05%2Fe348ca963a431520d0b6898dffd47fe4.jpg',
];

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

/// 自定义的活动横幅组件。
class ActivityBanner extends StatefulWidget {
  @override
  _ActivityBannerState createState() => _ActivityBannerState();
}

/// 与自定义的活动横幅组件关联的状态子类。
class _ActivityBannerState extends State<ActivityBanner> {
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
          items: worker<Widget>(imgList, (index, i) {
            // 容器组件，结合了常见的绘图、定位和大小调整的容器。
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.all(16.0),
                // 装饰（`decoration`）属性，子组件背后的装饰。
                // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                decoration: BoxDecoration(
                  // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                  // 装饰图片（`DecorationImage`）类，框装饰的图像。
                  image: DecorationImage(
                    // 装饰图片（`DecorationImage`）类的图片（`image`）属性，将图像绘制成装饰。
                    // 通常通过资产图片（`AssetImage`）使用随应用程序一起提供的图像，
                    // 或通过网络图像（`NetworkImage`）使用从网络获取的图像。
                    image: NetworkImage(i),
                    // 适应属性，如何在框里展示图像。
                    // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                    fit: BoxFit.cover,
                  ),
                  // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                  // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                  // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                  borderRadius: BorderRadius.all(
                    // 半径（`Radius`）类，圆形或椭圆形的半径。
                    // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                    Radius.circular(5.0),
                  ),
                  // 阴影
                  boxShadow: [
                    BoxShadow(
                      //阴影位置
                      offset: Offset(0.0, 5.0),
                      // 阴影颜色。
                      color: Color.fromRGBO(0, 0, 0, 0.19),
                      // 阴影模糊程度，大就更透明更扩散
                      blurRadius: 11.0,
                      // 阴影模糊大小，负的：缩小、 正的：增大。
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
              ),
              onTap: () {},
            );
          }),
          autoPlay: imgList.length > 1,
          autoPlayDuration: Duration(seconds: 1),
          interval: Duration(seconds: 5),
          viewportFraction: 1.0,
          aspectRatio: 7 / 2,
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
          child: imgList.length > 1
              // 行组件，用于在水平布局中显示其子组件。
              ? Row(
                  // 主轴对齐（`mainAxisAlignment`）组件，如何将孩子放在主轴上。
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((value) {
                    return Container(
                      // 边缘（`margin`）属性，空白的空间环绕装饰和子组件。
                      margin: EdgeInsets.only(
                        right: 4.0,
                        left: 4.0,
                        bottom: 20.0,
                      ),
                      // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
                      child: ClipOval(
                        child: Container(
                          color: value == imgList[_current]
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
