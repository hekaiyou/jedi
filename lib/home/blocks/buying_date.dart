import 'dart:async';
import 'package:flutter/material.dart';

/// 自定义的抢购时间组件。
class BuyingDate extends StatefulWidget {
  final int hour;
  final int minute;
  final int second;

  BuyingDate({
    this.hour,
    this.minute,
    this.second,
  });

  @override
  _BuyingDateState createState() => _BuyingDateState();
}

/// 与自定义的抢购时间组件关联的状态子类。
class _BuyingDateState extends State<BuyingDate> {
  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的小时数。
  int _hour;

  /// 当前倒计时的分钟数。
  int _minute;

  /// 当前倒计时的秒数。
  int _second;

  @override
  void initState() {
    // 初始化数据。
    _hour = widget.hour;
    _minute = widget.minute;
    _second = widget.second;
    // 启动倒计时，开始更新抢购剩余时间。
    _startTimer();
    super.initState();
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(
      // 以秒（`seconds`）为单位触发事件。
      Duration(seconds: 1),
      (timer) {
        // 当前倒计时的秒数结束时，变更当前倒计时的分钟数。
        if (_second == 0) {
          _second = 60;
          // 当前倒计时的分钟数结束时，变更当前倒计时的小时数。
          if (_minute == 0) {
            _minute = 60;
            // 当前倒计时的小时数结束时，取消并销毁计时器。
            if (_hour == 0) {
              _second = 0;
              _minute = 0;
              _cancelTimer();
            } else {
              _hour--;
            }
          } else {
            _minute--;
          }
        } else {
          _second--;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // 释放及停止相关资源。
    _cancelTimer();
    super.dispose();
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  /// 构建用于承托倒计时的剪辑椭圆形（`ClipOval`）组件。
  Widget _buildClipOval(int date) {
    // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
    return ClipOval(
      child: Container(
        // 颜色（`Color`）类的来自RGBO（`fromRGBO`）构造函数。
        // 从红色、绿色、蓝色和不透明度创建颜色，类似于CSS中的rgba()。
        color: Color.fromRGBO(0, 0, 0, 0.5),
        height: 20.0,
        width: 20.0,
        child: Center(
          child: Text(
            // 垫左（`padLeft`）方法，在字符串前面补占位符。
            date.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xffFDFDFD),
              fontFamily: 'PingFangRegular',
            ),
          ),
        ),
      ),
    );
  }

  /// 构建用于显示倒计时的文本（`Text`）组件。。
  Widget _buildColon() {
    return Text(
      ':',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0,
        color: Color(0xff4B4B4B),
        fontFamily: 'PingFangMedium',
        // 字母间距（`letterSpacing`）属性，每个字母之间添加的空间量。
        // 以逻辑像素为单位，可以使用负值来使字母更接近。
        letterSpacing: 4.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 7.0,
        left: 14.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildClipOval(
            _hour,
          ),
          _buildColon(),
          _buildClipOval(
            _minute,
          ),
          _buildColon(),
          _buildClipOval(
            _second,
          ),
        ],
      ),
    );
  }
}
