import 'dart:async';
import 'package:flutter/material.dart';

/// 自定义的滚动链接组件。
class ScrollingLink extends StatefulWidget {
  /// 新闻与新闻之间切换的时间（秒）。
  final int seconds;

  /// 放到滚动区域的新闻及其操作列表，格式为`[[String, String],...]`。
  final List<List> headlines;

  ScrollingLink({
    this.seconds,
    this.headlines,
  });

  @override
  _ScrollingLinkState createState() => _ScrollingLinkState();
}

/// 与自定义的滚动链接组件关联的状态子类。
class _ScrollingLinkState extends State<ScrollingLink> {
  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;

  /// 当前播放到第几个新闻。
  int _index;

  /// 滚动控制器（`ScrollController`）对象，控制可滚动的组件。
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // 初始化数据。
    _index = 1;
    _seconds = widget.seconds;
    // 启动倒计时，开始滚动列表。
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // 释放及停止相关资源。
    _cancelTimer();
    _controller.dispose();
    super.dispose();
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(
      // 以秒（`seconds`）为单位触发事件。
      Duration(seconds: 1),
      (timer) {
        _seconds--;
        if (_seconds == 0) {
          // 如果已经滚动到最后一个，通过缓冲项回到第一个新闻，产生循环效果。
          if (widget.headlines.length == _index) {
            // 滚动到缓冲项。
            _controller
                .animateTo(
              49.0 * _index,
              duration: Duration(milliseconds: 500),
              curve: Cubic(0.0, 0.0, 1.0, 1.0),
            )
                .then((value) {
              // 回到第一个新闻。
              _controller.jumpTo(0.0);
            });
            _index = 1;
          } else {
            // 动画到（`animateTo`）方法，将位置从其当前值动画到给定值。
            _controller.animateTo(
              49.0 * _index,
              duration: Duration(milliseconds: 500),
              // 立方体（`Cubic`）类，单位区间的三次多项式映射。
              // https://docs.flutter.io/flutter/animation/Cubic-class.html
              curve: Cubic(0.0, 0.0, 1.0, 1.0),
            );
            _index++;
          }
          _seconds = widget.seconds;
        }
      },
    );
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    List<GestureDetector> _listChild = [];

    // 构建可以点击的容器（`Container`）组件，用于显示新闻。
    Widget _buildItem(List line) {
      return GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            line[0],
            // 溢出的文本以省略号（`...`）显示。
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 14.0,
              fontFamily: 'PingFangRegular',
            ),
          ),
        ),
        onTap: () {},
      );
    }

    // 遍历新闻及其操作列表，批量构建显示新闻容器（`Container`）组件。
    widget.headlines.forEach((List line) {
      _listChild.add(_buildItem(line));
    });
    // 最后添加第一个新闻，避免从头开始滚动带来的突兀感。
    _listChild.add(_buildItem(widget.headlines[0]));

    return ListView(
      controller: _controller,
      itemExtent: 49.0,
      children: _listChild,
    );
  }
}
