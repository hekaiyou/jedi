import 'package:flutter/material.dart';

/// 自定义的抢购进度条组件。
class PanningProgress extends StatefulWidget {
  @override
  _PanningProgressState createState() => _PanningProgressState();
}

/// 与自定义的抢购进度条关联的状态子类。
class _PanningProgressState extends State<PanningProgress>
    with TickerProviderStateMixin {
  /// 当前的进度。
  double currentProgress = 0.6;
  // 动画相关控制器与补间。
  AnimationController animation;
  Tween<double> tween;

  @override
  void initState() {
    // AnimationController({
    //   double value,
    //   Duration duration,
    //   String debugLabel,
    //   double lowerBound: 0.0,
    //   double upperBound: 1.0,
    //   TickerProvider vsync
    // })
    // 创建动画控制器
    animation = AnimationController(
      // 这个动画应该持续的时间长短。
      duration: const Duration(milliseconds: 500),
      vsync: this,
      // void addListener(
      //   VoidCallback listener
      // )
      // 每次动画值更改时调用监听器
      // 可以使用removeListener删除监听器
    )..addListener(() {
        setState(() {});
      });
    // Tween({T begin, T end })：创建tween（补间）
    tween = Tween<double>(
      begin: 0.0,
      end: currentProgress,
    );
    // 开始向前运行这个动画（朝向最后）
    animation.forward();
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 10.0,
          width: 98.0,
          // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
          child: ClipRRect(
            // 边界半径（`borderRadius`）属性，圆角的边界半径。
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: LinearProgressIndicator(
              // Animation<T> animate(
              //   Animation<double> parent
              // )
              // 返回一个由给定动画驱动的新动画，但它承担由该对象确定的值
              value: tween.animate(animation).value,
              backgroundColor: Color(0xffFFE3E3),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFF4964)),
            ),
          ),
        ),
        Container(
          height: 10.0,
          width: 98.0,
          padding: EdgeInsets.only(left: 7.0),
          alignment: Alignment.centerLeft,
          child: Text(
            '已抢${(currentProgress * 100).toInt()}%',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 8.0,
              fontFamily: 'PingFangRegular',
            ),
          ),
        ),
      ],
    );
  }
}
