import 'package:flutter/material.dart';

/// 自定义的操作列表组件。
class OperationList extends StatelessWidget {
  /// 构建具体的操作行组件。
  Widget _buildOperationRow({String image, String title, Widget child}) {
    return GestureDetector(
      // 具体操作的细节，更新或跳转路由。
      onTap: () {
        print(title);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        height: 49.0,
        // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // 前置组件行区域。
            Row(
              children: <Widget>[
                // 该操作对应功能的特征图标。
                Image.asset(
                  image,
                  height: 18.0,
                  width: 18.0,
                  fit: BoxFit.contain,
                ),
                // 该操作对应功能的简述文字。
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff615D5B),
                      fontFamily: 'PingFangRegular',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            // 后置组件行区域。
            Row(
              children: <Widget>[
                // 运算符`??`，表示如果为空。
                // 如果没有传提醒组件，就显示占位组件。
                child ?? SizedBox(),
                // 显示右箭头的图标，提示用户这里可以点击。
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xffD8D8D8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249.0,
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
            offset: Offset(0.0, 6.0),
            // 阴影颜色。
            color: Color.fromRGBO(0, 0, 0, 0.04),
            // 阴影模糊程度，大就更透明更扩散
            blurRadius: 12.0,
            // 阴影模糊大小，负的：缩小、 正的：增大。
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          _buildOperationRow(
            image: 'assets/my_newbie_guide.png',
            title: '新手指引',
          ),
          // 一条分割线，下面还有四条一样的。
          Container(
            height: 1.0,
            color: Color(0xffE8EAED),
          ),
          _buildOperationRow(
            image: 'assets/my_yue_collection.png',
            title: '花生收藏',
            // 提醒用户还有多少张优惠券的文本（`Text`）组件。
            child: Text.rich(
              TextSpan(
                text: '有',
                children: [
                  TextSpan(
                    text: '3张',
                    style: TextStyle(
                      color: Color(0xffF4333C),
                    ),
                  ),
                  TextSpan(
                    text: '优惠券',
                  ),
                ],
                style: TextStyle(
                  color: Color(0xffA8A8A8),
                  fontFamily: 'PingFangRegular',
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Color(0xffE8EAED),
          ),
          _buildOperationRow(
            image: 'assets/my_official_announcement.png',
            title: '官方公告',
            // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
            // 提醒用户还有多少条新信息的圆角矩形剪裁（`ClipRRect`）组件。
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              child: Container(
                alignment: Alignment.center,
                color: Color(0xffF4333C),
                height: 14.0,
                width: 24.0,
                child: Text(
                  '24',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'PingFangBold',
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Color(0xffE8EAED),
          ),
          _buildOperationRow(
            image: 'assets/my_feedback.png',
            title: '意见反馈',
          ),
          Container(
            height: 1.0,
            color: Color(0xffE8EAED),
          ),
          _buildOperationRow(
            image: 'assets/my_about_us.png',
            title: '关于我们',
            // 提醒用户应用有新版本的文本（`Text`）组件。
            child: Text(
              '有新的更新',
              style: TextStyle(
                color: Color(0xffA8A8A8),
                fontFamily: 'PingFangRegular',
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
