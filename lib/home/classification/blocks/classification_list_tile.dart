import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 自定义的分类商品列表瓷砖组件。
class ClassificationListTile extends StatelessWidget {
  /// 商品ID。
  final int itemId;

  /// 商品图片地址。
  final String picturl;

  /// 优惠券面额。
  final String couponAmount;

  /// 折扣前价格。
  final String zkFinalPrice;

  /// 优惠券总量。
  final int couponTotalCount;

  /// 优惠券剩余量。
  final int couponRemainCount;

  /// 商品标题。
  final String title;

  /// 卖家类型，0=淘宝、1=天猫。。
  final int userType;

  /// 店铺名称。
  final String shopTitle;

  /// 商品图片。
  final List smallImages;

  /// 是否自平台商品。
  final String isselfupport;

  /// 二合一页面链接。
  final String couponShareUrl;

  /// 佣金比率，1550表示15.5%。
  final String commissionRate;

  ClassificationListTile({
    this.itemId,
    this.picturl,
    this.couponAmount,
    this.zkFinalPrice,
    this.couponRemainCount,
    this.couponTotalCount,
    this.commissionRate,
    this.title,
    this.userType,
    this.shopTitle,
    this.smallImages,
    this.isselfupport,
    this.couponShareUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 使用命名路由导航到第二个屏幕。
        Navigator.pushNamed(
          context,
          '/category/details',
          arguments: {
            'itemId': itemId,
            'title': title,
            'zkFinalPrice': zkFinalPrice,
            'userType': userType,
            'volume': couponTotalCount - couponRemainCount,
            'shopTitle': shopTitle,
            'smallImages': smallImages,
            'isselfupport': isselfupport,
            'zkfinalprices':
                double.parse(zkFinalPrice) - double.parse(couponAmount),
            'couponAmount': couponAmount,
            'couponShareUrl': couponShareUrl,
          },
        );
      },
      child: Container(
        // 通过容器（`Container`）组件的颜色（`color`）属性设置瓷砖的背景颜色。
        color: Color(0xffFFFFFF),
        // 通过填充（`Padding`）组件给瓷砖里面加填充空间。
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 13.0,
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 125.0,
                width: 106.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
                      child: ClipRRect(
                        // 边界半径（`borderRadius`）属性，圆角的边界半径。
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5.0),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: picturl,
                          height: 106.0,
                          width: 106.0,
                          fit: BoxFit.cover,
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
                          '预估收益：￥${(int.parse(commissionRate) / 10000 * double.parse(couponAmount)).toStringAsFixed(1)}',
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
                  height: 127.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: // 展示商品平台图标的图片。
                                Image.asset(
                              userType == 0
                                  ? 'assets/platform_taobao_identifier.png'
                                  : 'assets/platform_tmall_identifier.png',
                              width: 14.0,
                              height: 14.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // 显示订单商品描述的文本（`Text`）组件。
                          Text(
                            '     ' + title,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontFamily: 'PingFangMedium',
                              fontSize: 13.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          // 显示商品的购买金额的文本（`Text`）组件。
                          Text(
                            // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
                            '￥${(double.parse(zkFinalPrice) - double.parse(couponAmount)).toStringAsFixed(1)}',
                            style: TextStyle(
                              color: Color(0xffFF4964),
                              fontFamily: 'PingFangMedium',
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(width: 6.0),
                          // 显示商品的原价的文本（`Text`）组件。
                          Text(
                            '${userType == 0 ? '淘宝' : '天猫'}价￥$zkFinalPrice',
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontFamily: 'PingFangRegular',
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          '已售 ${couponTotalCount - couponRemainCount}',
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontFamily: 'PingFangRegular',
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      // 用来显示商品折扣力度的容器（`Container`）组件。
                      Container(
                        height: 20.0,
                        width: 65.0,
                        // 装饰（`decoration`）属性，子组件背���的装饰。
                        // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
                        decoration: BoxDecoration(
                          color: Color(0xffFFE0E6),
                          // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                          // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                          // 边界半径.所有（`BorderRadius.horizontal`）构造函数，创建水平对称的边框半径，
                          // 其中矩形的左侧和右侧具有相同的半径，可以设置一边的圆角边框。
                          borderRadius: BorderRadius.all(
                            // 半径（`Radius`）类，圆形或椭圆形的半径。
                            // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                            Radius.circular(10.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$couponAmount元券',
                          style: TextStyle(
                            color: Color(0xffFF395C),
                            fontFamily: 'PingFangMedium',
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
