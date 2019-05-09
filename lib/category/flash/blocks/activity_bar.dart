import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/carousel_with_indicator.dart';

/// 自定义的活动栏组件。
class ActivityBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 剪辑路径（`ClipPath`）组件，使用路径剪辑其子项。
    // 每当要绘制窗口组件时，都会在委托上调用回调，回调返回一个路径，组件阻止子项在路径外绘制。
    return Stack(
      children: <Widget>[
        // ClipPath(
        //   clipper: _ArcClipper(),
        //   child: DecoratedBox(
        //     // 装饰（`decoration`）属性，具体怎么画装饰。
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/app_bar_plate_3.png'),
        //         fit: BoxFit.fill,
        //       ),
        //       /* 使用代码绘制渐变效果的代码，因为无法实现效果图不使用。
        //         // 线性梯度（`gradient`）组件，2D线性渐变。
        //         gradient: LinearGradient(
        //       // 开始（`begin`）属性，放置渐变的0.0的偏移量。
        //       begin: Alignment.topRight,
        //       // 颜色（`colors`）属性，梯度应在每个停靠点处获得的颜色。
        //       colors: <Color>[
        //         const Color(0xffFF355B),
        //         const Color(0xffFF181C),
        //       ],) */
        //     ),
        //     child: Container(
        //       height: 145.0,
        //     ),
        //   ),
        // ),
        // Align(
        //   // 对准属性，如何调整子组件。
        //   alignment: Alignment.center,
        //   child: Container(
        //     padding: EdgeInsets.fromLTRB(14.0, 6.0, 14.0, 12.0),
        //     child: CarouselWithIndicator(),
        //   ),
        // ),
      ],
    );
  }
}