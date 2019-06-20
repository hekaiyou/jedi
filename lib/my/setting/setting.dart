import 'package:flutter/material.dart';
import 'package:jedi/my/setting/blocks/setting_options.dart';
import 'package:jedi/my/blocks/set_submit_button.dart';
import 'package:nautilus/nautilus.dart' as nautilus;

/// 自定义的设置页面组件。
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 中心标题（`centerTitle`）属性，标题是否显示在应用栏中间。
        centerTitle: true,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: Color(0xffFFFFFF),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 1.0,
        // 标题（`title`）属性，应用栏的主要组件。
        title: Text(
          '设置',
          style: TextStyle(
            color: Color(0xff000000),
            fontFamily: 'PingFangMedium',
          ),
        ),
      ),
      body: ListView(
        // 设置列表视图周围的填充，避免影响布局效果。
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          // 设置的列表视图（`ListView`）组件的填充和背景色。
          Container(
            color: Color(0xffFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 143.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
                      ClipOval(
                        // 显示当前头像图片的容器（`Container`）组件。
                        child: Container(
                          child: Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555530443316&di=4d977ef3c2c0f9b458f8e5f47ebf8346&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201706%2F22%2F20170622131955_h4eZS.thumb.700_0.jpeg'),
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // 显示操作提示的文本（`Text`）组件。
                      Text(
                        '点击修改头像',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff999999),
                          fontFamily: 'PingFangRegular',
                        ),
                      ),
                    ],
                  ),
                ),
                // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
                Divider(
                  color: Color(0xffE8EAED),
                  height: 1.0,
                ),
                SettingOptions(),
                SetSubmitButton(
                  title: '退出登录',
                  callback: () {
                    print('退出登录');
                    nautilus.logout().then((data) {
                      print(data);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
