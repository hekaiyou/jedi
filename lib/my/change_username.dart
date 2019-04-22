import 'package:flutter/material.dart';
import 'package:jedi/my/blocks/setting_frame.dart';
import 'package:jedi/my/blocks/set_submit_button.dart';

/// 自定义的修改昵称页面组件。
class ChangeUsernamePage extends StatefulWidget {
  @override
  _ChangeUsernamePageState createState() => _ChangeUsernamePageState();
}

/// 与自定义的修改昵称页面组件关联的状态子类。
class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  @override
  Widget build(BuildContext context) {
    return SettingFrame(
      title: '昵称',
      children: <Widget>[
        SizedBox(
          height: 17.0,
        ),
        Container(
          color: const Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          // 文本字段（`TextField`）组件，允许用户使用硬件键盘或屏幕键盘输入文本。
          child: TextField(
            // 光标颜色属性，绘制光标时使用的颜色。
            cursorColor: const Color(0xFFFE7C30),
            // 光标宽度属性，光标的厚度，默认是2.0。
            cursorWidth: 2.0,
            // 键盘类型属性，用于编辑文本的键盘类型。
            keyboardType: TextInputType.text,
            // 装饰（`decoration`）属性，在文本字段周围显示的装饰。
            // 输入装饰（`InputDecoration`）组件。
            decoration: InputDecoration(
              // 边框属性，装饰的容器周围绘制的形状。
              border: InputBorder.none,
              // 填充属性，如果为`true`，则装饰的容器将填充fillColor颜色。
              filled: true,
              // 填充颜色属性，填充装饰容器的颜色。
              fillColor: const Color(0xFFFFFFFF),
              // 提示样式属性，用于提示文本（`hintText`）的样式。
              hintStyle: TextStyle(
                // 字体大小。
                fontSize: 15.0,
                // 字体系列。
                fontFamily: 'PingFangRegular',
                // 颜色。
                color: const Color(0xFF999999),
              ),
              // 提示文本属性，提示字段接受哪种输入的文本。
              hintText: '输入新的昵称',
              // 是密集属性，输入子项是否是密集形式的一部分（即使用较少的垂直空间）。
              isDense: false,
            ),
          ),
        ),
        SetSubmitButton(
          title: '确认修改',
          callback: () {
            print('确认修改');
          },
        ),
      ],
    );
  }
}
