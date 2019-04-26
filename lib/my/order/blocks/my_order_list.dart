import 'package:flutter/material.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/my/order/blocks/my_order_list_tile.dart';

/// 自定义的我的订单列表组件。
class MyOrderList extends StatefulWidget {
  @override
  _MyOrderListState createState() => _MyOrderListState();
}

/// 与自定义的我的订单列表组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _MyOrderListState extends State<MyOrderList>
    with AutomaticKeepAliveClientMixin {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // 第一次构建后会被调用。
    WidgetsBinding.instance.addPostFrameCallback((context) {
      triggerPullController.triggerPull();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// 页面数据的刷新与加载方法。
  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      fetchExplosion().then((item) {
        List<Widget> _list = item.map((Map map) {
          return MyOrderListTile(
            picture: map['picture'],
            title: map['title'],
            consumption: map['consumption'],
            income: map['income'],
          );
        }).toList();
        setState(() {
          widgetList = _list;
        });
      });
    } else {
      fetchExplosion().then((item) {
        List<Widget> _list = item.map((Map map) {
          return MyOrderListTile(
            picture: map['picture'],
            title: map['title'],
            consumption: map['consumption'],
            income: map['income'],
          );
        }).toList();
        setState(() {
          widgetList.addAll(_list);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PullAndPush(
      // 简单的配置头部和底部的样式。
      defaultRefreshBoxTipText: '松开将为你刷新数据……',
      defaultRefreshBoxTextColor: Color(0xff666666),
      defaultRefreshBoxBackgroundColor: Color(0xffF6F6F6),
      defaultRefreshBoxRefreshIconPath: 'assets/refresh.png',
      // 可通过此对象的方法调用触发下拉刷新。
      triggerPullController: triggerPullController,
      // 用于上下拉的滑动控件。
      listView: ListView.builder(
        itemCount: widgetList.length,
        controller: controller,
        physics: scrollPhysics,
        itemBuilder: (BuildContext context, int index) {
          return widgetList[index];
        },
      ),
      // 加载数据的回调。
      loadData: (isPullDown) async {
        // `isPullDown`为`true`时表示下拉刷新，为`false`时表示上拉加载。
        await _loadData(isPullDown);
      },
      // 列表视图（`ListView`）组件中的滚动物理（`scrollPhysics`）组件发生改变时回调。
      scrollPhysicsChanged: (ScrollPhysics physics) {
        // 通过`setState()`方法改变列表视图（`ListView`）组件的物理（`Physics`）属性。
        setState(() {
          // 这个不用改，照抄即可。
          scrollPhysics = physics;
        });
      },
    );
  }
}

Future<List<Map>> fetchExplosion() async {
  final response = await Future.delayed(Duration(milliseconds: 50), () {
    return [
      {
        "picture":
            "https://img.alicdn.com/imgextra/i3/836552381/TB2lr2TaqLN8KJjSZFGXXbjrVXa_!!836552381-0-daren.jpg_180x180xzq90.jpg_.webp",
        "title": "新款5.8英寸iPhone X",
        "consumption": "6658.0",
        "income": "66.58",
      },
      {
        "picture":
            "https://img.alicdn.com/imgextra/i1/3107144874/TB2i9NXbwkLL1JjSZFpXXa7nFXa_!!3107144874-0-beehive-scenes.jpg_180x180xzq90.jpg_.webp",
        "title": "max破产都要买的口红",
        "consumption": "178.0",
        "income": "1.78",
      },
      {
        "picture":
            "https://img.alicdn.com/imgextra/i3/845871947/TB2X6qOv30kpuFjSspdXXX4YXXa_!!845871947.jpg_180x180xzq90.jpg_.webp",
        "title": "MissCandy指甲油",
        "consumption": "82.0",
        "income": "0.82",
      },
      {
        "picture":
            "https://img.alicdn.com/bao/uploaded/TB2TwSlvnlYBeNjSszcXXbwhFXa_!!2874289741.jpg_180x180xzq90.jpg_.webp",
        "title": "麦米米代餐饱腹玉米早餐粗粮煎饼1000g整箱薄脆饼干网红零食薄饼",
        "consumption": "29.8",
        "income": "0.29",
      },
      {
        "picture":
            "https://img.alicdn.com/bao/uploaded/TB2Vpv0jm3PL1JjSZFxXXcBBVXa_!!1912954876-0-beehive-scenes.jpg_180x180xzq90.jpg_.webp",
        "title": "美国HOTSUIT暴汗服女套装健身房发汗衣跑步运动服瑜伽爆汗服男",
        "consumption": "459.0",
        "income": "4.59",
      },
      {
        "picture":
            "https://img.alicdn.com/bao/uploaded/TB22XHbEb9YBuNjy0FgXXcxcXXa_!!2194888462-0-beehive-scenes.jpg_180x180xzq90.jpg_.webp",
        "title": "keith铠斯纯钛锅超轻户外野餐炊具把手煎锅碗汤钛锅便携套锅1-3人",
        "consumption": "319.0",
        "income": "3.19",
      },
      {
        "picture":
            "https://img.alicdn.com/imgextra/i4/47537911/TB2k1lrhmXlpuFjy0FeXXcJbFXa_!!47537911-0-beehive-scenes.jpg_180x180xzq90.jpg_.webp",
        "title": "限量军绿色PUMA IGNITE evoKNIT",
        "consumption": "399.0",
        "income": "3.99",
      },
      {
        "picture":
            "https://img.alicdn.com/imgextra/i1/2348167658/O1CN0126RPXWNIblZq1XW_!!2348167658-0-daren.jpg_180x180xzq90.jpg_.webp",
        "title": "天王表 天猫联名款石英男表",
        "consumption": "999.0",
        "income": "9.99",
      },
      {
        "picture":
            "https://img.alicdn.com/bao/uploaded/TB2GRBDbXXXXXcEXXXXXXXXXXXX_!!2181560909.jpg_180x180xzq90.jpg_.webp",
        "title": "Selens 喜乐仕L-M 三脚架 相机云台 竖拍板 竖拍架 L型快装板",
        "consumption": "32.0",
        "income": "0.32",
      },
    ];
  });
  return response;
}
