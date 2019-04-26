import 'package:flutter/material.dart';

/// 自定义的我的订单列表瓷砖组件。
class MyOrderListTile extends StatelessWidget {
  /// 订单商品的图片地址。
  final String picture;

  /// 订单商品的描述名称。
  final String title;

  /// 订单的消费金额。
  final String consumption;

  /// 该订单的预估收益。
  final String income;

  MyOrderListTile({
    this.picture,
    this.title,
    this.consumption,
    this.income,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 通过容器（`Container`）组件的颜色（`color`）属性设置瓷砖的背景颜色。
      color: Color(0xffFFFFFF),
      child: Column(
        children: <Widget>[
          // 通过填充（`Padding`）组件给瓷砖里面加填充空间。
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                // 显示商品图片的容器（`Container`）组件。
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                    // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                    // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                    // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                    borderRadius: BorderRadius.horizontal(
                      // 半径（`Radius`）类，圆形或椭圆形的半径。
                      // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                      left: Radius.circular(4.0),
                    ),
                  ),
                  child: Image.network(picture),
                ),
                // 通过大小框（`SizedBox`）组件在图片与介绍之间插入分隔空间。
                SizedBox(width: 8.0),
                // 让订单介绍部分占据当前行（`Row`）组件的剩余空间。
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // 显示订单商品描述的文本（`Text`）组件。
                        Text(
                          title,
                          // 溢出的文本以省略号（`...`）显示。
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontFamily: 'PingFangMedium',
                            fontSize: 14.0,
                          ),
                        ),
                        // 显示订单创建日的文本（`Text`）组件。
                        Text(
                          '创建日 03-03 21：04',
                          // 溢出的文本以省略号（`...`）显示。
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontFamily: 'PingFangRegular',
                            fontSize: 12.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // 显示商品订单号的文本（`Text`）组件。
                            Text(
                              '订单号：1098765432678904',
                              // 溢出的文本以省略号（`...`）显示。
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff999999),
                                fontFamily: 'PingFangRegular',
                                fontSize: 12.0,
                              ),
                            ),
                            // 显示复制按钮的手势探测器（`GestureDetector`）组件。
                            GestureDetector(
                              onTap: () {
                                print('复制');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 24.0,
                                width: 34.0,
                                color: Color(0xffFFFFFF),
                                child: Text(
                                  '复制',
                                  style: TextStyle(
                                    color: Color(0xffFE823A),
                                    fontFamily: 'PingFangRegular',
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // 显示订单消费金额的文本（`Text`）组件。
                            Text(
                              '消费金额：￥' + consumption,
                              // 溢出的文本以省略号（`...`）显示。
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontFamily: 'PingFangRegular',
                                fontSize: 14.0,
                              ),
                            ),
                            Container(
                              height: 20.0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                                vertical: 1.0,
                              ),
                              alignment: Alignment.center,
                              // 装饰（`decoration`）属性，子组件背后的装饰。
                              // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                              decoration: BoxDecoration(
                                // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                                // 装饰图片（`DecorationImage`）类，框装饰的图像。
                                image: DecorationImage(
                                  // 装饰图片（`DecorationImage`）类的图片（`image`）属性，将图像绘制成装饰。
                                  // 通常通过资产图片（`AssetImage`）使用随应用程序一起提供的图像，
                                  // 或通过网络图像（`NetworkImage`）使用从网络获取的图像。
                                  image: AssetImage(
                                      'assets/my_order_rectangle.png'),
                                  // 适应属性，如何在框里展示图像。
                                  // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // 显示订单预估收益的文本（`Text`）组件。
                              child: Text(
                                '预估收益：￥' + income,
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'PingFangRegular',
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
          Divider(
            color: Color(0xffDDDDDD),
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
