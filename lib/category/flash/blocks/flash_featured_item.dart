import 'package:flutter/material.dart';

/// 自定义的品牌闪购项目组件。
class FlashFeaturedItem extends StatelessWidget {
  /// 商品ID。
  final int id;

  FlashFeaturedItem({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 使用命名路由导航到第二个屏幕。
        Navigator.pushNamed(
          context,
          '/category/details',
          arguments: id,
        );
      },
      // 显示单个闪购项目信息的容器（`Container`）组件。
      child: Container(
        height: 170.0,
        width: 98.0,
        margin: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          top: 16.0,
          bottom: 33.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // 用来显示商品图片的容器（`Container`）组件。
            Container(
              height: 98.0,
              child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557746826504&di=f2b9518e6b242c019b056997291d1282&imgtype=0&src=http%3A%2F%2Fimg000.hc360.cn%2Fg8%2FM01%2FFD%2F0B%2FwKhQt1P7RbiEUjIkAAAAAK1MZxQ915.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // 用来显示销售商品名称的容器（`Container`）组件。
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '商品名称',
                // 溢出的文本以省略号（`...`）显示。
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: 'PingFangBold',
                  fontSize: 14.0,
                ),
              ),
            ),
            // 用来显示销售商品券后价的容器（`Container`）组件。
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '券后价：￥90',
                style: TextStyle(
                  color: Color(0xffFE3A5D),
                  fontFamily: 'PingFangMedium',
                  fontSize: 14.0,
                ),
              ),
            ),
            // 用来显示商品折扣力度的容器（`Container`）组件。
            Container(
              height: 20.0,
              width: 65.0,
              // 装饰（`decoration`）属性，子组件背后的装饰。
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
                '20元券',
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
    );
  }
}
