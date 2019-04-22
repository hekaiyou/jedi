import 'package:flutter/material.dart';

/// 描述文本相关组件使用的样式。
final TextStyle descriptiveTextStyle = TextStyle(
  // 字体大小。
  fontSize: 15.0,
  // 字体系列。
  fontFamily: 'PingFangRegular',
  // 颜色。
  color: const Color(0xFF666666),
);

/// 自定义的设置框架组件。
class SettingFrame extends StatelessWidget {
  /// 当前设置页面的标题。
  final String title;

  /// 当前设置页面的主要内容。
  final List<Widget> children;

  SettingFrame({
    this.title,
    this.children,
  });

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
          title,
          style: TextStyle(
            color: Color(0xff000000),
            fontFamily: 'PingFangMedium',
          ),
        ),
      ),
      body: ListView(
        // 设置列表视图周围的填充，避免影响布局效果。
        padding: EdgeInsets.all(0.0),
        children: children,
      ),
    );
  }
}
