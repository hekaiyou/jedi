import 'package:flutter/material.dart';

/// 自定义的猜你喜欢列表瓷砖组件。
class LikeListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 通过容器（`Container`）组件的颜色（`color`）属性设置瓷砖的背景颜色。
      color: Color(0xffFFFFFF),
      // 通过填充（`Padding`）组件给瓷砖里面加填充空间。
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 121.0,
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
                      child: Image.network(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557845972529&di=c30518d798a79b89527cee541664aad6&imgtype=0&src=http%3A%2F%2Fimg000.hc360.cn%2Fhb%2FMTQ1OTgwMTY1MDcxNy00MTkxODU3OTI%3D.jpg',
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
                          image:
                              AssetImage('assets/limited_estimated_price.png'),
                          // 适应属性，如何在框里展示图像。
                          // https://docs.flutter.io/flutter/painting/BoxFit-class.html
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text(
                        '预估收益：￥' + '12.0',
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
                height: 121.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        // 展示商品平台图标的网络图片。
                        Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557124160693&di=688cc2c13afc84b26013f67bb4267e93&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F5667c06ab78f66d9b64b14119d40e2a1606ce70e1e73-FDbTnk_fw658',
                          width: 16.0,
                          height: 16.0,
                        ),
                        // 显示订单商品描述的文本（`Text`）组件。
                        Text(
                          '     ' + '阿斯顿发送到asdfasf阿斯顿发142342324发asdf撒地方',
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontFamily: 'PingFangMedium',
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        // 显示商品的购买金额的文本（`Text`）组件。
                        Text(
                          '￥' + '12.0',
                          style: TextStyle(
                            color: Color(0xffFF4964),
                            fontFamily: 'PingFangMedium',
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(width: 6.0),
                        // 显示商品的原价的文本（`Text`）组件。
                        Text(
                          '天猫价￥' + '12.0',
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontFamily: 'PingFangRegular',
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '已售' + '1200',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontFamily: 'PingFangRegular',
                        fontSize: 12.0,
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
            ),
          ],
        ),
      ),
    );
  }
}
