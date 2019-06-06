import 'package:flutter/material.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/my/order/blocks/subordinate_order_tile.dart';

/// 自定义的下级订单组件。
class SubordinateOrder extends StatefulWidget {
  @override
  _SubordinateOrderState createState() => _SubordinateOrderState();
}

/// 与自定义的下级订单组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _SubordinateOrderState extends State<SubordinateOrder>
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
          return SubordinateOrderTile(
            headImage: map['head'],
            name: map['name'],
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
          return SubordinateOrderTile(
            headImage: map['head'],
            name: map['name'],
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
      defaultRefreshBoxTextColor: Color(0xff666666),
      defaultRefreshBoxBackgroundColor: Color(0xffF6F6F6),
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
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3479749790,2299805250&fm=26&gp=0.jpg",
        "name": "衣裳湿半",
        "consumption": "6658.0",
        "income": "66.58",
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1498062160,929260808&fm=26&gp=0.jpg",
        "name": "离开不挽留",
        "consumption": "178.0",
        "income": "1.78",
      },
      {
        "head":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3169098940,3888729626&fm=26&gp=0.jpg",
        "name": "人心会说谎",
        "consumption": "82.0",
        "income": "0.82",
      },
      {
        "head":
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2665879753,3605301824&fm=11&gp=0.jpg",
        "name": "咽泪装欢",
        "consumption": "29.8",
        "income": "0.29",
      },
      {
        "head":
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1965783224,957735291&fm=26&gp=0.jpg",
        "name": "时光毁爱 i",
        "consumption": "459.0",
        "income": "4.59",
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1248970396,81409608&fm=26&gp=0.jpg",
        "name": "拨开发梢",
        "consumption": "319.0",
        "income": "3.19",
      },
      {
        "head":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556291051951&di=03ff098cf9eda5c59181045c9e678a73&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F568a311d469a469df8254043e24412f75b36c12d39545-JMdJGN_fw658",
        "name": "像扔包袱",
        "consumption": "399.0",
        "income": "3.99",
      },
      {
        "head":
            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1887668936,2223855695&fm=26&gp=0.jpg",
        "name": "要散何必在一起",
        "consumption": "999.0",
        "income": "9.99",
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=298724022,2832904054&fm=26&gp=0.jpg",
        "name": "猫在裙角",
        "consumption": "32.0",
        "income": "0.32",
      },
    ];
  });
  return response;
}
