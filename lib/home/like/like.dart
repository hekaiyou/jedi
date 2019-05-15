import 'package:flutter/material.dart';
import 'package:jedi/home/like/blocks/like_list_tile.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';

/// 自定义的猜你喜欢页面组件。
class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

/// 与自定义的猜你喜欢组件关联的状态子类。
class _LikePageState extends State<LikePage> {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  @override
  void initState() {
    // 第一次构建后会被调用。
    WidgetsBinding.instance.addPostFrameCallback((context) {
      triggerPullController.triggerPull();
    });
    super.initState();
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          widgetList = [LikeListTile()];
          widgetList.addAll([LikeListTile()]);
        });
      });
    } else {
      Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          widgetList.addAll([LikeListTile()]);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
