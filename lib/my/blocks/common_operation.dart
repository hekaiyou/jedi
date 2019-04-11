import 'package:flutter/material.dart';

/// 自定义的常用操作组件。
class CommonOperation extends StatelessWidget {
  /// 构建具体的常用操作列组件。
  Widget _buildOperationColumn(
      {String image, String title, String fresh = '0'}) {
    return GestureDetector(
      // 具体操作的细节，更新或跳转路由。
      onTap: () {
        print(title);
      },
      child: SizedBox(
        width: 33.0,
        height: 45.0,
        child: Stack(
          children: <Widget>[
            // 常用操作列组件的本体。
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  image,
                  width: 25.0,
                  height: 22.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff615D5B),
                    fontFamily: 'PingFangRegular',
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
            // 如果有新信息。
            fresh != '0'
                // 显示新信息提醒角标。
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 13.0,
                      width: 23.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/my_common_corner.png',
                          ),
                        ),
                      ),
                      // 显示具体信息数量的文本（`Text`）组件。
                      child: Text(
                        fresh,
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangBold',
                          fontSize: 9.0,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.0,
      // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.horizontal(
          // 半径（`Radius`）类，圆形或椭圆形的半径。
          // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
          right: Radius.circular(10.0),
          left: Radius.circular(10.0),
        ),
        // 阴影
        boxShadow: [
          BoxShadow(
            //阴影位置
            offset: Offset(0.0, 5.0),
            // 阴影颜色。
            color: Color.fromRGBO(52, 23, 0, 0.12),
            // 阴影模糊程度，大就更透明更扩散
            blurRadius: 15.0,
            // 阴影模糊大小，负的：缩小、 正的：增大。
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildOperationColumn(image: 'assets/my_income.png', title: '收益'),
          _buildOperationColumn(
              image: 'assets/my_order.png', title: '订单', fresh: '1'),
          _buildOperationColumn(image: 'assets/my_fans.png', title: '粉丝'),
          _buildOperationColumn(image: 'assets/my_invitation.png', title: '邀请'),
        ],
      ),
    );
  }
}
