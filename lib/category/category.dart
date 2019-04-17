import 'package:flutter/material.dart';
import 'package:jedi/category/appbar_title.dart';

/// 自定义的类别页面组件。
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

/// 与自定义的类别页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  /// 用户当前选择的视图下标。
  int _currentSelection = 0;

  /// 页面控制器（`PageController`）组件，允许你操纵在页面视图（`PageView`）组件中可见的页面。
  PageController _controller = PageController();

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFFFFFF),
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 0.5,
        // 标题间距（`titleSpacing`）属性，横轴上标题内容周围的间距，即使没有前导内容或操作，也会应用此间距。
        // 如果希望标题（`title`）属性占用所有可用空间，请将此值设置为0.0。
        titleSpacing: 0.0,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: AppBarTitle(),
      ),
      // 为了获取数据并将其显示在屏幕上，我们可以使用未来构建（`FutureBuilder`）组件。
      // 未来构建（`FutureBuilder`）组件附带未来（`Flutter`），可以轻松使用异步数据源。
      body: FutureBuilder<List<Map>>(
        // 我们希望与之合作的未来（`Flutter`），我们将调用自定义的请求函数。
        future: fetchCategory(),
        // 一个构建器函数，它告诉未来（`Flutter`）要呈现什么，
        // 具体取决于未来（`Flutter`）返回的状态：加载、成功或失败。
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: <Widget>[
                Container(
                  color: Color(0xffFFFFFF),
                  // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
                  height: double.infinity,
                  width: 95.0,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int position) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentSelection = position;
                            // 更改哪个页面显示在受控的页面视图（`PageView`）组件中。
                            _controller.jumpToPage(position);
                          });
                        },
                        child: Container(
                          // 如果是用户当前选择的视图下标，显示特殊样式。
                          color: _currentSelection == position
                              ? Color(0xffF8F8F8)
                              : Color(0xffFFFFFF),
                          height: 50.0,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.data[position]['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'PingFangRegular',
                                    // 如果是用户当前选择的视图下标，显示特殊样式。
                                    color: _currentSelection == position
                                        ? Color(0xffFE7C30)
                                        : Color(0xff333333),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  width: 30.0,
                                  height: 2.0,
                                  // 如果是用户当前选择的视图下标，显示特殊样式。
                                  color: _currentSelection == position
                                      ? Color(0xffFE7C30)
                                      : Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    // 装饰（`decoration`）属性，具体怎么画装饰。
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      border: Border(
                        // 边界边（`BorderSide`）类，盒子边框的一面。
                        left: BorderSide(
                          color: Color(0xffE2E2E2),
                          width: 2.0,
                        ),
                      ),
                    ),
                    // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
                    height: double.infinity,
                    // 页面视图（`PageView`）组件，可逐页工作的可滚动列表，每个子项都被强制与视窗大小相同。
                    child: PageView(
                      // 控制器（`controller`）属性，用于控制滚动此页面视图位置的对象。
                      controller: _controller,
                      // 物理（`physics`）属性，页面视图应如何响应用户输入。
                      // 从不可滚动滚动物理（`NeverScrollableScrollPhysics`）类，不允许用户滚动。
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data.map((Map<dynamic, dynamic> _map) {
                        // 网格视图（`GridView`）组件的网格视图.计数（`GridView.count`）构建函数，
                        // 创建一个可滚动的2D组件数组，在横轴上具有固定数量的切片。
                        return GridView.count(
                          // 跨轴计数（`crossAxisCount`）属性，一行可以放多少切片。
                          crossAxisCount: 3,
                          children: List.generate(
                            _map['subList'].length,
                            (index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
                                    ClipOval(
                                      child: Image.network(
                                        _map['subList'][index]['pic'],
                                        height: 50.0,
                                        width: 50.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      _map['subList'][index]['name'],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'PingFangRegular',
                                        color: Color(0xff666666),
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
          // 默认情况下，显示自定义的加载组件。
          return Center(
            // 循环进度指标（`CircularProgressIndicator`）组件环进度指示器，旋转以指示应用程序正忙。
            child: CircularProgressIndicator(
              // 值颜色（`valueColor`）属性，指标的颜色是动画的值。
              valueColor: AlwaysStoppedAnimation(
                Color(0xffFE7C30),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<List<Map>> fetchCategory() async {
  final response = await Future.delayed(Duration(milliseconds: 50), () {
    return [
      {
        "name": "母婴",
        "subList": [
          {
            "name": "婴童服饰",
            "pic": "http://images.huasheng100.com/public/1536573128962533.jpg",
          },
          {
            "name": "玩具书籍",
            "pic": "http://images.huasheng100.com/public/1531133040149562.png",
          },
          {
            "name": "婴童寝居",
            "pic": "http://images.huasheng100.com/public/1536573209736422.jpg",
          },
          {
            "name": "婴童洗护",
            "pic": "http://images.huasheng100.com/public/1531132957368930.png",
          },
          {
            "name": "喂养用品",
            "pic": "http://images.huasheng100.com/public/1536573609239223.jpg",
          },
          {
            "name": "出行产品",
            "pic": "http://images.huasheng100.com/public/1536573701154246.jpg",
          },
          {
            "name": "孕产用品",
            "pic": "http://images.huasheng100.com/public/1536574193666902.jpg",
          },
          {
            "name": "尿不湿",
            "pic": "http://images.huasheng100.com/public/1536573912617886.jpg",
          },
          {
            "name": "婴童湿巾",
            "pic": "http://images.huasheng100.com/public/1536648351360812.jpg",
          },
          {
            "name": "奶粉/其他",
            "pic": "http://images.huasheng100.com/public/1536648289179712.jpg",
          },
          {
            "name": "妈咪包背婴带",
            "pic": "http://images.huasheng100.com/public/1531133002648626.png",
          },
          {
            "name": "安全座椅",
            "pic": "http://images.huasheng100.com/public/1531196325699050.png",
          },
          {
            "name": "童桌童床",
            "pic": "http://images.huasheng100.com/public/1531196360712458.png",
          }
        ],
      },
      {
        "name": "食品",
        "subList": [
          {
            "name": "谷物冲饮",
            "pic": "http://images.huasheng100.com/public/1537860238619929.png",
          },
          {
            "name": "休闲零食",
            "pic": "http://images.huasheng100.com/public/1536832111592213.png",
          },
          {
            "name": "精选肉食",
            "pic": "http://images.huasheng100.com/public/1536832161256319.png",
          },
          {
            "name": "坚果蜜饯",
            "pic": "http://images.huasheng100.com/public/1531135328979477.png",
          },
          {
            "name": "糕点饼干",
            "pic": "http://images.huasheng100.com/public/1536831358398372.png",
          },
          {
            "name": "水果蔬菜",
            "pic": "http://images.huasheng100.com/public/1536841627060110.png",
          },
          {
            "name": "保健滋补",
            "pic": "http://images.huasheng100.com/public/1540193067446732.jpg",
          },
          {
            "name": "河海生鲜",
            "pic": "http://images.huasheng100.com/public/1536841731440519.png",
          },
          {
            "name": "茶酒冲饮",
            "pic": "http://images.huasheng100.com/public/1536831383880829.png",
          },
          {
            "name": "粮油调味",
            "pic": "http://images.huasheng100.com/public/1536832087268321.png",
          }
        ],
      },
    ];
  });
  return response;
}
