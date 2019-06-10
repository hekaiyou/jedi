import 'package:flutter/material.dart';
import 'package:jedi/category/search/blocks/appbar_title.dart';
import 'package:jedi/category/search/blocks/search_item.dart';

/// 自定义的搜索页面组件。
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

/// 与自定义的类别页面组件关联的状态子类。
class _SearchPageState extends State<SearchPage> {
  /// 热门搜索项目的字符串（`String`）列表。
  List<String> popular = [
    '父亲节 礼物',
    '施华蔻超低底价',
    '冰糖黄桃4罐',
    '零食大礼包',
    '天然洗衣粉5斤',
    '立白洗衣液6KG',
    '红豆玉米祛湿茶',
  ];

  /// 历史搜索项目的字符串（`String`）列表。
  List<String> history = [
    '和',
    '任天堂二手Switch游戏 NS 赛尔达传说 荒野之息 中文 现货供应 正版',
    '现在简约客厅灯',
    '好',
    '现在',
    '哈',
    '测试环境的手机号登陆接口性能有明显降低',
    '玉桂狗',
    '体育用品',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFFFFFF),
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 1.0,
        // 标题间距（`titleSpacing`）属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 设置应用栏是否需要显示前置组件，就是系统默认的返回按钮。
        automaticallyImplyLeading: false,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: AppBarTitle(),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.whatshot,
                  size: 19.0,
                  color: const Color(0xFF666666),
                ),
                Text(
                  ' 大家都在搜',
                  style: TextStyle(
                    // 字体大小。
                    fontSize: 15.0,
                    // 字体系列。
                    fontFamily: 'PingFangMedium',
                    // 颜色。
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          SearchItem(searchs: popular),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.restore,
                  size: 19.0,
                  color: const Color(0xFF666666),
                ),
                Text(
                  ' 搜索历史',
                  style: TextStyle(
                    // 字体大小。
                    fontSize: 15.0,
                    // 字体系列。
                    fontFamily: 'PingFangMedium',
                    // 颜色。
                    color: const Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
          SearchItem(searchs: history),
        ],
      ),
    );
  }
}
