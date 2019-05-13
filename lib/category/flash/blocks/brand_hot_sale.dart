import 'package:flutter/material.dart';

/// 自定义的热销项目类，包含自定义的热销榜单组件需要的数据。
class HotItem {
  /// 商品图片地址。
  final String objUrl;

  /// 销售商品名称。
  final String title;

  /// 折扣后价格。
  final double rebatePrice;

  /// 优惠券折扣。
  final double couponPrice;

  HotItem({
    this.objUrl,
    this.title,
    this.rebatePrice,
    this.couponPrice,
  });
}

/// 自定义的品牌热卖标题组件。
class BrandHotSale extends StatelessWidget {
  /// 从服务器获取的热销榜单数据。
  final List<HotItem> hotData;

  BrandHotSale({
    this.hotData,
  });

  /// 构建用于显示单个热卖产品信息的容器（`Container`）组件。
  Widget _buildCard(HotItem hotItem) {
    return Container(
      height: 146.0,
      width: 98.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              // 用来显示商品图片的容器（`Container`）组件。
              Container(
                height: 98.0,
                child: Image.network(hotItem.objUrl),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 2.0,
                  top: 2.0,
                  bottom: 2.0,
                  right: 6.0,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/brand_discount_bottom_plate.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                // 显示优惠价格的文本（`Text`）组件。
                child: Text(
                  '优惠20元',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'PingFangRegular',
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
          // 用来显示销售商品名称的填充（`Padding`）组件。
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Text(
              hotItem.title,
              // 溢出的文本以省略号（`...`）显示。
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: 'PingFangBold',
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(height: 2.0),
          Row(
            children: <Widget>[
              // 显示券后价描述的容器（`Container`）组件。
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: 1.0,
                ),
                color: Color(0xffFE3A5D),
                child: Text(
                  '券后价',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'PingFangMedium',
                    fontSize: 10.0,
                  ),
                ),
              ),
              // 显示券后价的文本（`Text`）组件。
              Text(
                '￥34.9',
                style: TextStyle(
                  color: Color(0xffFF4964),
                  fontFamily: 'PingFangBold',
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      // 单个组件滚动视图（`SingleChildScrollView`）组件。
      // 可以滚动单个组件的框，当有一个完全可见的单个框时，此组件非常有用。
      // 例如时间选择器中的时钟面，但如果容器在一个轴上太小，则需要确保它可以滚动。
      child: SingleChildScrollView(
        // 滚动方向（`scrollDirection`）属性，滚动视图滚动的轴方向。
        scrollDirection: Axis.horizontal,
        // 填充（`padding`）属性，插入子组件的空间量。
        padding: EdgeInsets.symmetric(
          horizontal: 11.0,
          vertical: 16.0,
        ),
        child: Row(
          children: hotData.map((HotItem hotItem) {
            return _buildCard(hotItem);
          }).toList(),
        ),
      ),
    );
  }
}
