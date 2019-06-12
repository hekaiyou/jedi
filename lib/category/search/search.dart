import 'package:flutter/material.dart';
import 'package:jedi/category/search/blocks/appbar_title.dart';
import 'package:jedi/category/search/blocks/search_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> history = [];

  @override
  void initState() {
    _loadHistory();
    super.initState();
  }

  /// 在启动时加载历史搜索数据。
  _loadHistory() async {
    // 要读取数据，我们可以使用SharedPreferences类提供的相应getter方法。对于每个setter，
    // 都有一个相应的getter。例如，我们可以使用getInt，getBool和getString方法。
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // 尝试从历史搜索键读取数据。如果它不存在，则返回空列表。
      history = (prefs.getStringList('history') ?? []);
    });
  }

  /// 增加历史搜索数据。
  _addSearch(String onSubmitted) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    history.removeWhere((item) => item == onSubmitted);
    setState(() {
      history.insert(0, onSubmitted);
      prefs.setStringList('history', history);
    });
    // 使用命名路由导航到第二个屏幕。
    Navigator.pushNamed(
      context,
      '/category/result',
      arguments: {
        'typeName': onSubmitted,
      },
    );
  }

  /// 清理历史搜索数据。
  _deleteSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      history = [];
      prefs.setStringList('history', history);
    });
  }

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
        title: AppBarTitle(
          submittedCallback: _addSearch,
        ),
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
          SizedBox(height: 2.0),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
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
                GestureDetector(
                  onTap: () {
                    _deleteSearch();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 21.0,
                        width: 39.0,
                        color: Color(0xffFFFFFF),
                      ),
                      Text(
                        '清除',
                        style: TextStyle(
                          // 字体大小。
                          fontSize: 15.0,
                          // 字体系列。
                          fontFamily: 'PingFangRegular',
                          // 颜色。
                          color: const Color(0xFF666666),
                        ),
                      ),
                    ],
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
