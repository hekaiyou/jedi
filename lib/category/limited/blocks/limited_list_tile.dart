import 'package:flutter/material.dart';
import 'package:jedi/category/limited/blocks/discount_rate.dart';
import 'package:jedi/category/limited/blocks/panning_progress.dart';

/// 自定义的限时抢购列表瓷砖组件。
class LimitedListTile extends StatelessWidget {
  /// 商品的图片地址。
  final String picture;

  /// 商品的描述名称。
  final String title;

  /// 商品的购买金额。
  final String consumption;

  /// 该商品的预估收益。
  final String income;

  LimitedListTile({
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
                Container(
                  height: 122.0,
                  width: 106.0,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        // 显示商品图片的容器（`Container`）组件。
                        child: Container(
                          decoration: BoxDecoration(
                            // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                            // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                            // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                            // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Image.network(
                            picture,
                            height: 106.0,
                            width: 106.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        // 显示商品预估收益的容器（`Container`）组件。
                        child: Container(
                          height: 21.0,
                          width: 106.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // 框装饰（`BoxDecoration`）类的图片（`image`）属性，要在背景颜色或渐变上方绘制的图像。
                            // 装饰图片（`DecorationImage`）类，框装饰的图像。
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/limited_estimated_price.png'),
                              // 适应属性，如何在框里展示图像。
                              // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Text(
                            '预估收益：￥' + income,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xffFFFFFF),
                              fontFamily: 'PingFangRegular',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 通过大小框（`SizedBox`）组件在图片与介绍之间插入分隔空间。
                SizedBox(width: 16.0),
                // 让商品介绍部分占据当前行（`Row`）组件的剩余空间。
                Expanded(
                  child: Container(
                    height: 122.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            // 展示商品平台图标的网络图片。
                            Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557124160693&di=688cc2c13afc84b26013f67bb4267e93&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F5667c06ab78f66d9b64b14119d40e2a1606ce70e1e73-FDbTnk_fw658',
                              width: 16.0,
                              height: 16.0,
                            ),
                            // 通过大小框（`SizedBox`）组件在商品平台图标与文本之间插入分隔空间。
                            SizedBox(width: 5.0),
                            Expanded(
                              // 显示订单商品描述的文本（`Text`）组件。
                              child: Text(
                                title,
                                // 溢出的文本以省略号（`...`）显示。
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontFamily: 'PingFangRegular',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 显示商品特征说明的容器（`Container`）组件。
                        Container(
                          height: 20.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 1.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFFF2EA),
                            // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                            // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                            // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                            // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: Text(
                            '舒适面料 弹性十足',
                            style: TextStyle(
                              color: Color(0xffFF6D26),
                              fontFamily: 'PingFangMedium',
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        PanningProgress(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    // 显示商品的购买金额的文本（`Text`）组件。
                                    Text(
                                      '￥' + consumption,
                                      style: TextStyle(
                                        color: Color(0xffFF4964),
                                        fontFamily: 'PingFangMedium',
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(width: 6.0),
                                    // 显示商品的原价的文本（`Text`）组件。
                                    Text(
                                      '￥39.9',
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontFamily: 'PingFangRegular',
                                        fontSize: 12.0,
                                        // 在文本上添加删除线。
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                DiscountRate(couponPrice: 10.0),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              // 显示“马上抢”按钮的容器（`Container`）组件。
                              child: Container(
                                height: 29.0,
                                width: 69.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffFF4964),
                                  // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                                  // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                                  // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                                  // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  '马上抢',
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontFamily: 'PingFangRegular',
                                    fontSize: 14.0,
                                  ),
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
