import 'package:flutter/material.dart';
import 'package:jedi/my/blocks/setting_frame.dart';
import 'package:jedi/my/blocks/set_submit_button.dart';

/// 自定义的修改手机页面组件。
class ModifyPhonePage extends StatefulWidget {
  @override
  _ModifyPhonePageState createState() => _ModifyPhonePageState();
}

/// 与自定义的修改手机页面组件关联的状态子类。
class _ModifyPhonePageState extends State<ModifyPhonePage> {
  @override
  Widget build(BuildContext context) {
    return SettingFrame(
      title: '修改手机号',
      children: <Widget>[
        SizedBox(height: 17.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          color: Color(0xffFFFFFF),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '新手机号',
                    style: descriptiveTextStyle,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFFFFFFF),
                      padding: EdgeInsets.only(left: 8.0),
                      // 文本字段（`TextField`）组件，允许用户使用硬件键盘或屏幕键盘输入文本。
                      child: TextField(
                        // 光标颜色属性，绘制光标时使用的颜色。
                        cursorColor: const Color(0xFFFE7C30),
                        // 光标宽度属性，光标的厚度，默认是2.0。
                        cursorWidth: 2.0,
                        // 键盘类型属性，用于编辑文本的键盘类型。
                        keyboardType: TextInputType.phone,
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
                          hintStyle: descriptiveTextStyle,
                          // 提示文本属性，提示字段接受哪种输入的文本。
                          hintText: '输入新的手机号码',
                          // 是密集属性，输入子项是否是密集形式的一部分（即使用较少的垂直空间）。
                          isDense: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '验证码   ',
                    style: descriptiveTextStyle,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFFFFFFF),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      // 文本字段（`TextField`）组件，允许用户使用硬件键盘或屏幕键盘输入文本。
                      child: TextField(
                        // 光标颜色属性，绘制光标时使用的颜色。
                        cursorColor: const Color(0xFFFE7C30),
                        // 光标宽度属性，光标的厚度，默认是2.0。
                        cursorWidth: 2.0,
                        // 键盘类型属性，用于编辑文本的键盘类型。
                        keyboardType: TextInputType.number,
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
                          hintStyle: descriptiveTextStyle,
                          // 提示文本属性，提示字段接受哪种输入的文本。
                          hintText: '请输入验证码',
                          // 是密集属性，输入子项是否是密集形式的一部分（即使用较少的垂直空间）。
                          isDense: false,
                        ),
                      ),
                    ),
                  ),
                  // 显示获取验证码按钮的容器（`Container`）组件。
                  Container(
                    alignment: Alignment.center,
                    width: 99.0,
                    height: 27.0,
                    decoration: BoxDecoration(
                      // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                      // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
                      border: Border.all(
                        // 宽度参数，边框的宽度。
                        width: 1.0,
                        // 颜色参数，边框的颜色。
                        color: const Color(0xffFE823A),
                      ),
                      // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                      // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                      // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                      borderRadius: BorderRadius.all(
                        // 半径（`Radius`）类，圆形或椭圆形的半径。
                        // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                        Radius.circular(14.0),
                      ),
                    ),
                    child: Text(
                      '获取验证码',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffFE823A),
                        fontFamily: 'PingFangRegular',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SetSubmitButton(
          title: '下一步',
          callback: () {
            print('下一步');
          },
        ),
      ],
    );
  }
}
