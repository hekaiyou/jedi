import 'package:flutter/material.dart';

/// 自定义的应用栏标题组件。
class AppBarTitle extends StatelessWidget {
  /// 文本字段提交时的回调函数。
  final Function(String) submittedCallback;

  AppBarTitle({
    this.submittedCallback,
  });

  @override
  Widget build(BuildContext context) {
    // 装饰盒（`DecoratedBox`）组件，在子组件绘画之前或之后绘制装饰的组件。
    return DecoratedBox(
      // 装饰（`decoration`）属性，具体怎么画装饰。
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
      ),
      child: Row(
        // 主轴对齐（`mainAxisAlignment`）属性，如何将子组件放在主轴上。
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 扩展（`Expanded`）组件，用于展开行（`Row`）、列（`Column`）或柔性（`Flex`）的子项。
          Expanded(
            child: Container(
              // 填充（`padding`）属性，在装饰里面的空白空间，如果有的话，将子组件放在这个衬垫内。
              margin: EdgeInsets.only(left: 14.0),
              height: 28.0,
              decoration: BoxDecoration(
                color: Color(0xffE8E8E8),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.search,
                      size: 16.0,
                      color: Color(0xff999999),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      // 光标颜色属性，绘制光标时使用的颜色。
                      cursorColor: const Color(0xFFFE7C30),
                      // 光标宽度属性，光标的厚度，默认是2.0。
                      cursorWidth: 2.0,
                      // 键盘类型属性，用于编辑文本的键盘类型。
                      keyboardType: TextInputType.text,
                      // 样式属性，用于正在编辑的文本的样式。
                      style: TextStyle(
                        // 字体大小。
                        fontSize: 15.0,
                        // 字体系列。
                        fontFamily: 'PingFangRegular',
                        // 颜色。
                        color: const Color(0xff333333),
                      ),
                      // 装饰（`decoration`）属性，在文本字段周围显示的装饰。
                      // 输入装饰（`InputDecoration`）组件。
                      decoration: InputDecoration(
                        // 边框属性，装饰的容器周围绘制的形状。
                        border: InputBorder.none,
                        // 提示文本属性，提示字段接受哪种输入的文本。
                        hintText: '粘贴宝贝标题，先领券再购物',
                        // 是密集属性，输入子项是否是密集形式的一部分（即使用较少的垂直空间）。
                        isDense: true,
                        // 提示样式属性，用于提示文本（`hintText`）的样式。
                        hintStyle: TextStyle(
                          // 字体大小。
                          fontSize: 13.0,
                          // 字体系列。
                          fontFamily: 'PingFangRegular',
                          // 颜色。
                          color: const Color(0xFF666666),
                        ),
                      ),
                      onSubmitted: (String onSubmitted) {
                        if (onSubmitted.trim() != '') {
                          submittedCallback(onSubmitted.trim());
                        }
                      },
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(
                right: 14.0,
                left: 12.0,
              ),
              color: Color(0xffFFFFFF),
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'PingFangMedium',
                  color: Color(0xff333333),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
