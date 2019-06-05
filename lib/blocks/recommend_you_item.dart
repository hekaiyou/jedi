import 'package:flutter/material.dart';
import 'package:jedi/blocks/discount_rate.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 自定义的推荐项目类，包含自定义的为你推荐组件需要的数据。
class RecommendItem {
  /// 商品图片地址。
  final String picturl;

  /// 商品ID。
  final int itemId;

  /// 销售商品名称。
  final String title;

  /// 折扣后价格。
  final double rebatePrice;

  /// 折扣前价格。
  final String zkFinalPrice;

  /// 优惠券面额。
  final String couponAmount;

  /// 优惠券总量。
  final int couponTotalCount;

  /// 优惠券剩余量。
  final int couponRemainCount;

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

  RecommendItem({
    this.picturl,
    this.title,
    this.rebatePrice,
    this.zkFinalPrice,
    this.couponAmount,
    this.couponRemainCount,
    this.couponTotalCount,
    this.itemId,
    this.userType,
    this.shopTitle,
    this.smallImages,
    this.isselfupport,
    this.couponShareUrl,
    this.commissionRate,
  });
}

/// 自定义的为你推荐项目组件。
class RecommendYouItem extends StatelessWidget {
  final int row;
  final RecommendItem recommendItem;

  RecommendYouItem({
    this.row,
    this.recommendItem,
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
            'itemId': recommendItem.itemId,
            'title': recommendItem.title,
            'zkFinalPrice': recommendItem.zkFinalPrice,
            'userType': recommendItem.userType,
            'volume': recommendItem.couponTotalCount -
                recommendItem.couponRemainCount,
            'shopTitle': recommendItem.shopTitle,
            'smallImages': recommendItem.smallImages,
            'isselfupport': recommendItem.isselfupport,
            'zkfinalprices': double.parse(recommendItem.zkFinalPrice) -
                double.parse(recommendItem.couponAmount),
            'couponAmount': recommendItem.couponAmount,
            'couponShareUrl': recommendItem.couponShareUrl,
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          // 如果是当前行的第一个组件，余量加在右边，否则加在左边。
          left: row == 0 ? 0.0 : 6.0,
          right: row == 0 ? 6.0 : 0.0,
        ),
        width: double.infinity,
        // 装饰（`decoration`）属性，子组件背后的装饰。
        // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
        decoration: BoxDecoration(
          color: Color(0xffF7F7F7),
          // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
          // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
          // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
          borderRadius: BorderRadius.all(
            // 半径（`Radius`）类，圆形或椭圆形的半径。
            // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
            Radius.circular(6.0),
          ),
        ),
        height: 270.0,
        child: Column(
          children: <Widget>[
            // 用来显示商品图片的容器（`Container`）组件。
            Container(
              width: double.infinity,
              height: 166.0,
              // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
              child: ClipRRect(
                // 边界半径（`borderRadius`）属性，圆角的边界半径。
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6.0),
                ),
                child: CachedNetworkImage(
                  height: 166.0,
                  imageUrl: recommendItem.picturl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 用来显示销售商图片和商品名称的容器（`Container`）组件。
            Container(
              padding: EdgeInsets.all(4.0),
              child: Stack(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  // 展示商品平台图标的图片。
                  child: Image.asset(
                    recommendItem.userType == 0
                        ? 'assets/platform_taobao_identifier.png'
                        : 'assets/platform_tmall_identifier.png',
                    width: 13.0,
                    height: 13.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  '     ' + recommendItem.title,
                  // 溢出的文本以省略号（`...`）显示。
                  overflow: TextOverflow.ellipsis,
                  // 最大线（`maxLines`）属性，文本要跨越的可选最大行数，必要时包装。
                  // 如果文本超过给定的行数，则会根据溢出（`overflow`）将其截断。
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: 'PingFangBold',
                    fontSize: 13.0,
                  ),
                ),
              ]),
            ),
            // 用来显示优惠券折扣和预估收益的容器（`Container`）组件。
            Container(
              padding: EdgeInsets.only(
                left: 4.0,
                right: 16.0,
                top: 1.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DiscountRate(couponPrice: recommendItem.couponAmount),
                  Container(
                    padding: EdgeInsets.only(
                      left: 7.0,
                      right: 7.0,
                      top: 1.0,
                    ),
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF1E9),
                    ),
                    // 用来显示预估收益的文本（`Text`）组件。
                    child: Text(
                      '预估收益：¥${(int.parse(recommendItem.commissionRate) / 10000 * double.parse(recommendItem.couponAmount)).toStringAsFixed(1)}',
                      style: TextStyle(
                        color: Color(0xffFE823A),
                        fontFamily: 'PingFangBold',
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // 用来显示商品折扣情况的填充（`Padding`）组件。
                  Padding(
                    padding: EdgeInsets.only(
                      right: 4.0,
                      left: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // 用来显示商品折扣价的文本（`Text`）组件。
                        Text.rich(
                          TextSpan(
                            text: '¥',
                            children: [
                              TextSpan(
                                // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
                                text: recommendItem.rebatePrice
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                  // 字母间距（`letterSpacing`）属性，每个字母之���添加的空间量。
                                  // 以逻辑像素为单位，���以使用负值来使字母更接近。
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              color: Color(0xffFF4964),
                              fontFamily: 'PingFangBold',
                              fontSize: 14.0,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        // 用来显示商品成本价的文本（`Text`）组件。
                        Text.rich(
                          TextSpan(
                            text: '¥',
                            children: [
                              TextSpan(
                                text: recommendItem.zkFinalPrice,
                                style: TextStyle(
                                  // 字母间距（`letterSpacing`）属性，每个字母之间添加的空间量。
                                  // 以逻辑像素为单位，可以使用负值来使字母更接近。
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontFamily: 'PingFangRegular',
                              fontSize: 12.0,
                              letterSpacing: 4.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 4.0,
                    ),
                    // 用来显示领劵总人数的文本（`Text`）组件。
                    child: Text(
                      // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
                      // 领劵总人数大于10000时，以“万”为单位显示。
                      recommendItem.couponTotalCount -
                                  recommendItem.couponRemainCount >
                              10000
                          ? '已售' +
                              ((recommendItem.couponTotalCount -
                                          recommendItem.couponRemainCount) /
                                      10000)
                                  .toStringAsFixed(1) +
                              '万'
                          : '已售${recommendItem.couponTotalCount - recommendItem.couponRemainCount}',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontFamily: 'PingFangRegular',
                        fontSize: 10.0,
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
