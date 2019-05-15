import 'package:flutter/material.dart';

/// 自定义的设置提交按钮组件。
class SetSubmitButton extends StatelessWidget {
  /// 提交按钮的描述。
  final String title;

  /// 按钮的内部填充。
  final EdgeInsetsGeometry padding;

  /// 按钮的回调函数。
  final Function callback;

  SetSubmitButton({
    this.title,
    this.callback,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 运算符`??`，表示如果为空。
      padding: padding ??
          EdgeInsets.only(
            top: 60.0,
            left: 32.0,
            right: 32.0,
            bottom: 30.0,
          ),
      child: GestureDetector(
        onTap: callback,
        // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
        child: ClipRRect(
          // 边界半径（`borderRadius`）属性，圆角的边界半径。
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          // 显示确认修改按钮的容器（`Container`）组件。
          child: Container(
            alignment: Alignment.center,
            height: 40,
            color: Color(0xffFE823A),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xffFFFFFF),
                fontFamily: 'PingFangMedium',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
