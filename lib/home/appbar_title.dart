import 'package:flutter/material.dart';

/// 自定义的应用栏标题组件。
class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 装饰盒（`DecoratedBox`）组件，在子组件绘画之前或之后绘制装饰的组件。
    return DecoratedBox(
      // 装饰（`decoration`）属性，具体怎么画装饰。
      decoration: BoxDecoration(
        // 线性梯度（`gradient`）组件，2D线性渐变。
        gradient: LinearGradient(
          // 开始（`begin`）属性，放置渐变的0.0的偏移量。
          begin: Alignment.topRight,
          // 颜色（`colors`）属性，梯度应在每个停靠点处获得的颜色。
          colors: <Color>[
            const Color(0xffFF447C),
            const Color(0xffFF447B),
            const Color(0xffFF447B),
            const Color(0xffFF4072),
            const Color(0xffFF3F70),
          ],
        ),
      ),
      child: Row(
        // 主轴对齐（`mainAxisAlignment`）属性，如何将子组件放在主轴上。
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 手势探测器（`GestureDetector`）组件，检测手势的组件。
          GestureDetector(
            child: Container(
              // 填充（`padding`）属性，在装饰里面的空白空间，如果有的话，将子组件放在这个衬垫内。
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Image.asset(
                'assets/app_bar_scan.png',
                height: 23,
                width: 23,
              ),
            ),
            // 在点击（`onTap`）熟悉，已经发生了点击时触发。
            onTap: () {},
          ),
          // 扩展（`Expanded`）组件，用于展开行（`Row`）、列（`Column`）或柔性（`Flex`）的子项。
          Expanded(
            child: GestureDetector(
              child: Container(
                height: 28.0,
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(24.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/navigation_classify.png',
                      height: 12,
                      width: 12,
                    ),
                    Text(
                      ' 粘贴宝贝标题，先领券再购物',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Image.asset(
                'assets/app_bar_service.png',
                height: 23,
                width: 23,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
