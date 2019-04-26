import 'package:flutter/material.dart';

/// 自定义的下级订单瓷砖组件。
class SubordinateOrderTile extends StatelessWidget {
  /// 粉丝的头像地址。
  final String headImage;

  /// 粉丝的昵称。
  final String name;

  /// 订单的消费金额。
  final String consumption;

  /// 该订单的预估收益。
  final String income;

  SubordinateOrderTile({
    this.headImage,
    this.name,
    this.consumption,
    this.income,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 容器（`Container`）组件的颜色（`color`）属性，通常用于设置背景色。
      color: Color(0xffFFFFFF),
      child: Column(
        children: <Widget>[
          // 列表瓷砖（`ListTile`）组件，单个固定高度的行，通常包含一些文本以及前导或尾随图标。
          ListTile(
            // 圆形剪裁（`ClipOval`）组件，通常用来裁剪头像图片。
            leading: ClipOval(
              child: Image.network(
                headImage,
                height: 36.0,
                width: 36.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 显示粉丝名称的文本（`Text`）组件。
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: 'PingFangMedium',
                    fontSize: 18.0,
                  ),
                ),
                // 显示粉丝订单消费金额的文本（`Text`）组件。
                Text(
                  '消费金额：￥' + consumption,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: 'PingFangRegular',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                          image: AssetImage('assets/my_order_rectangle.png'),
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
            isThreeLine: true,
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
