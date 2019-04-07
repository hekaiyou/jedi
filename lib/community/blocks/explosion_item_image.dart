import 'package:flutter/material.dart';

/// 自定义的每日爆款项目图片组件。
class ExplosionItemImage extends StatelessWidget {
  ///项目图片的详细信息。
  final Map subItem;

  ExplosionItemImage({
    this.subItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      // 框装饰（`BoxDecoration`）类，关于如何绘制框的不可变描述。
      decoration: BoxDecoration(
        // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
        // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
        // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
        borderRadius: BorderRadius.all(
          // 半径（`Radius`）类，圆形或椭圆形的半径。
          // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
          Radius.circular(5.0),
        ),
      ),
      margin: EdgeInsets.only(
        top: 8.0,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // 用来显示商品的图片（`Image`）组件。
          Image.network(subItem['picUrl']),
          Container(
            height: 21.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/community_label.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            // 用来显示预估收益的文本（`Text`）组件。
            child: Text.rich(
              TextSpan(
                text: '预估收益：',
                children: [
                  TextSpan(
                    text: '¥',
                    style: TextStyle(
                      // 字母间距（`letterSpacing`）属性，每个字母之间添加的空间量。
                      // 以逻辑像素为单位，可以使用负值来使字母更接近。
                      letterSpacing: 4.0,
                    ),
                  ),
                  TextSpan(
                    // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
                    text: subItem['earnMoney'].toStringAsFixed(2),
                    style: TextStyle(
                      letterSpacing: 0.0,
                    ),
                  ),
                ],
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: 'PingFangMedium',
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
