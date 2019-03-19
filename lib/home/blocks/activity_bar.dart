import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/carousel_with_indicator.dart';

/// 自定义的弧形裁剪组件。
/// 自定义剪辑（`CustomClipper`）抽象类，用于提供自定义剪辑的界面。
class _ArcClipper extends CustomClipper<Path> {
  // 得到剪辑（`getClip`）抽象方法，给定被剪裁的渲染对象具有给定大小的剪辑描述。
  @override
  Path getClip(Size size) {
    // 路径（`Path`）类，平面的复杂一维子集，路径由许多子路径和当前点组成。
    // 子路径由各种类型的段组成，例如线、弧或贝塞尔曲线，子路径可以是打开或关闭的，并且可以自相交。
    var path = Path();
    // 线到（`lineTo`）方法，添加从当前点到给定点的直线段。
    // 起点变量。
    path.lineTo(0.0, size.height - 39);
    // 偏移（`Offset`）类，不可变的2D浮点偏移量。
    // 第一个控制点和第一点变量。
    var firstControlPoint = Offset(size.width / 4, size.height - 73);
    var firstPoint = Offset(size.width / 2, size.height - 73);
    // 二次贝塞尔曲（`quadraticBezierTo`）方法，
    // 使用控制点（x1，y1）添加从当前点到给定点（x2，y2）的二次贝塞尔曲线段。
    // 第一个中间曲线变量。
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
    // 第二个控制点和第二点变量。
    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height - 73);
    // 第二个中间曲线变量。
    var secondPoint = Offset(size.width, size.height - 39);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);
    // 终点变量。
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  // 应该重新剪辑（`shouldReclip`）抽象方法，每当为剪辑对象提供自定义剪辑器委托类的新实例时，
  // 或者在使用自定义画家委托类的新实例创建新剪辑对象的任何时候调用，这相当于同一事物，因为后者是按前者执行。
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // 实现应该重新剪辑(`shouldReclip`)方法。
    return true;
  }
}

/// 自定义的活动栏组件。
class ActivityBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 剪辑路径（`ClipPath`）组件，使用路径剪辑其子项。
    // 每当要绘制窗口组件时，都会在委托上调用回调，回调返回一个路径，组件阻止子项在路径外绘制。
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: _ArcClipper(),
          child: DecoratedBox(
            // 装饰（`decoration`）属性，具体怎么画装饰。
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/app_bar_plate_3.png'),
                fit: BoxFit.fill,
              ),
              /* 使用代码绘制渐变效果的代码，因为无法实现效果图不使用。
                // 线性梯度（`gradient`）组件，2D线性渐变。
                gradient: LinearGradient(
              // 开始（`begin`）属性，放置渐变的0.0的偏移量。
              begin: Alignment.topRight,
              // 颜色（`colors`）属性，梯度应在每个停靠点处获得的颜色。
              colors: <Color>[
                const Color(0xffFF355B),
                const Color(0xffFF181C),
              ],) */
            ),
            child: Container(
              height: 145.0,
            ),
          ),
        ),
        Align(
          // 对准属性，如何调整子组件。
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.fromLTRB(14.0, 6.0, 14.0, 12.0),
            child: CarouselWithIndicator(),
          ),
        ),
      ],
    );
  }
}
