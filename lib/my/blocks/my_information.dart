import 'package:flutter/material.dart';

/// 自定义的我的信息组件。
class MyInformation extends StatelessWidget {
  /// 构建用户名下面显示数据的小徽章组件。
  Widget _buildSmallMark(String title) {
    // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
    return ClipRRect(
      // 边界半径（`borderRadius`）属性，圆角的边界半径。
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        alignment: Alignment.center,
        color: Color(0xffEF3664),
        height: 18.0,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'PingFangBold',
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 根据系统操作栏高度设置占位用大小框（`SizedBox`）组件的高度。
        SizedBox(
          // 媒体查询数据（`MediaQueryData`）类的大小（`size`）属性，逻辑像素中的媒体大小，即屏幕的大小。
          // 媒体查询数据（`MediaQueryData`）类的填充（`padding`）属性，应用程序可以呈现的显示矩形每一侧的物理像素数。
          // 填充（`padding`）属性的顶部（`top`）值是状态栏高度，底部（`bottom`）值是系统操作栏高度。
          height: MediaQuery.of(context).padding.top + 29.0,
        ),
        // 显示用户基本信息的组件。
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 显示用户基本信息的行（`Row`）组件。
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 显示用户头像的填充（`Padding`）组件。
                  Padding(
                    padding: EdgeInsets.only(right: 11.0),
                    // 圆形剪裁（`ClipOval`）组件，通常用来裁剪头像图片。
                    child: ClipOval(
                      child: Image.network(
                        'https://inews.gtimg.com/newsapp_bt/0/7254692084/1000',
                        height: 46.0,
                        width: 46.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 显示用户名称与基本数据的大小框（`SizedBox`）组件。
                  SizedBox(
                    height: 46.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // 显示用户名称的文本（`Text`）组件。
                        Text(
                          '昵称昵称昵称',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'PingFangRegular',
                            fontSize: 16.0,
                          ),
                        ),
                        // 显示用户基本数据的行（`Row`）组件。
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: _buildSmallMark('粉丝 0'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: _buildSmallMark('成长值 45'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // 显示信息、设置入口按钮的行（`Row`）组件。
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('信息');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: ImageIcon(
                        AssetImage('assets/my_message.png'),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        size: 20.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('设置');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5.0,
                        right: 1.0,
                      ),
                      child: ImageIcon(
                        AssetImage('assets/my_settings.png'),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // 显示邀请码的填充（`Padding`）组件。
        Padding(
          padding: EdgeInsets.only(
            left: 75.0,
            right: 16.0,
            top: 7.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '邀请码：',
                      style: TextStyle(
                        fontFamily: 'PingFangRegular',
                      ),
                    ),
                    TextSpan(
                      text: 'JWAXV7C',
                    ),
                  ],
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 12.0,
                  ),
                ),
              ),
              // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xffFFFFFF),
                  height: 17.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '复制',
                    style: TextStyle(
                      color: Color(0xffF13E31),
                      fontFamily: 'PingFangRegular',
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
