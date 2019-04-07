import 'package:flutter/material.dart';

/// 自定义的收益详情组件。
class IncomeSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      // 靠顶部中间对齐。
      alignment: Alignment.topCenter,
      child: Container(
        // 媒体查询数据（`MediaQueryData`）类的大小（`size`）属性，逻辑像素中的媒体大小，即屏幕的大小。
        // 媒体查询数据（`MediaQueryData`）类的填充（`padding`）属性，应用程序可以呈现的显示矩形每一侧的物理像素数。
        // 填充（`padding`）属性的顶部（`top`）值是状态栏高度，底部（`bottom`）值是系统操作栏高度。
        height: MediaQuery.of(context).padding.top < 18
            ? MediaQuery.of(context).padding.top
            : 214.0 + MediaQuery.of(context).padding.top - 18,
        // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
        width: double.infinity,
        // 装饰（`decoration`）属性，子组件背后的装饰。
        // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
        decoration: BoxDecoration(
          // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
          // 装饰图片（`DecorationImage`）类，框装饰的图像。
          image: DecorationImage(
            // 装饰图片（`DecorationImage`）类的图片（`image`）属性，将图像绘制成装饰。
            // 通常通过资产图片（`AssetImage`）使用随应用程序一起提供的图像，
            // 或通过网络图像（`NetworkImage`）使用从网络获取的图像。
            image: AssetImage('assets/income_bottom_plate.png'),
            // 适应属性，如何在框里展示图像。
            // https://docs.flutter.io/flutter/painting/BoxFit-class.html
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            // 根据系统状态栏高度设置一个占位区域。
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            // 显示页面标题的容器（`Container`）组件。
            Container(
              height: 44.0,
              alignment: Alignment.center,
              child: Text(
                '收益',
                style: TextStyle(
                  color: Color(0xffF9F9F9),
                  fontFamily: 'PingFangMedium',
                  fontSize: 18.0,
                ),
              ),
            ),
            // 显示收益描述说明文本的填充（`Padding`）组件。
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '累计收益（元）',
                    style: TextStyle(
                      color: Color(0xffEAEAEA),
                      fontFamily: 'PingFangRegular',
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '昨日收益',
                    style: TextStyle(
                      color: Color(0xffEAEAEA),
                      fontFamily: 'PingFangRegular',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            // 显示收益信息文本的填充（`Padding`）组件。
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '￥236.02',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: 'PingFangMedium',
                      fontSize: 22.0,
                    ),
                  ),
                  Text(
                    '+2.02',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontFamily: 'PingFangMedium',
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
            // 显示账户余额和提现按钮的填充（`Padding`）组件。
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              // 用来区分账户余额和提现按钮的行（`Row`）组件。
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 显示账户余额描述说明的文本（`Text`）组件。
                      Text(
                        '账户余额',
                        style: TextStyle(
                          color: Color(0xffEAEAEA),
                          fontFamily: 'PingFangRegular',
                          fontSize: 12.0,
                        ),
                      ),
                      // 显示账户余额信息的文本（`Text`）组件。
                      Text(
                        '￥236.02',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangRegular',
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  // 显示提现按钮的容器（`Container`）组件。
                  Container(
                    alignment: Alignment.center,
                    width: 59.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                      // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
                      border: Border.all(
                        // 宽度参数，边框的宽度。
                        width: 1.0,
                        // 颜色参数，边框的颜色。
                        color: const Color(0xffFFFFFF),
                      ),
                      // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                      // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                      // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                      borderRadius: BorderRadius.all(
                        // 半径（`Radius`）类，圆形或椭圆形的半径。
                        // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                        Radius.circular(17.0),
                      ),
                    ),
                    child: Text(
                      '提现',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'PingFangMedium',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
