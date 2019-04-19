import 'package:flutter/material.dart';
//import 'package:nautilus/nautilus.dart' as nautilus;
//nautilus.login();

/// 自定义的设置页面组件。
class SettingPage extends StatelessWidget {
  /// 构建具体的操作行组件。
  Widget _buildOperationRow({String title, Widget child}) {
    return GestureDetector(
      // 具体操作的细节，更新或跳转路由。
      onTap: () {
        print(title);
      },
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 49.0,
            // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 该操作对应功能的简述文字。
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff2B2F33),
                    fontFamily: 'PingFangRegular',
                    fontSize: 15.0,
                  ),
                ),
                // 后置组件区域。
                child != null
                    ? child
                    // 显示右箭头的图标，提示用户这里可以点击。
                    : Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xffD8D8D8),
                      ),
              ],
            ),
          ),
          // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
          Divider(
            color: Color(0xffE8EAED),
            height: 1.0,
          ),
        ],
      ),
    );
  }

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
                _buildOperationRow(title: '昵称'),
                _buildOperationRow(title: '我的标签'),
                _buildOperationRow(title: '支付宝绑定'),
                _buildOperationRow(title: '微信绑定'),
                _buildOperationRow(title: '修改手机号'),
                _buildOperationRow(title: '修改密码'),
                _buildOperationRow(title: '消息通知'),
                _buildOperationRow(
                  title: '清除缓存',
                  // 显示清除按钮的容器（`Container`）组件。
                  child: Container(
                    alignment: Alignment.center,
                    width: 58.0,
                    height: 27.0,
                    decoration: BoxDecoration(
                      // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                      // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
                      border: Border.all(
                        // 宽度参数，边框的宽度。
                        width: 1.0,
                        // 颜色参数，边框的颜色。
                        color: const Color(0xffFE823A),
                      ),
                      // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
                      // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
                      // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
                      borderRadius: BorderRadius.all(
                        // 半径（`Radius`）类，圆形或椭圆形的半径。
                        // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                        Radius.circular(14.0),
                      ),
                    ),
                    child: Text(
                      '清除',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffFE823A),
                        fontFamily: 'PingFangRegular',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 30.0,
                  ),
                  // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
                  child: ClipRRect(
                    // 边界半径（`borderRadius`）属性，圆角的边界半径。
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    // 显示退出登陆按钮的容器（`Container`）组件。
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      color: Color(0xffFE823A),
                      child: Text(
                        '退出登录',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangMedium',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
