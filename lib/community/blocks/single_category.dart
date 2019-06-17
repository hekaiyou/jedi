import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/community/blocks/explosion_item.dart';
import 'package:jedi/internet/api_commodity.dart';

/// 自定义的单分类页面组件。
class SingleCategoryPage extends StatefulWidget {
  final int id;

  SingleCategoryPage({
    this.id,
  });

  @override
  _SingleCategoryPageState createState() => _SingleCategoryPageState();
}

/// 与自定义的单分类页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的标签栏视图（`TabBarView`）组件切换时被重新绘制。
class _SingleCategoryPageState extends State<SingleCategoryPage>
    with AutomaticKeepAliveClientMixin {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  bool _isPushEnable = true;

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @protected
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

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      apiGetBbsdetail(categoryid: widget.id).then((item) {
        widgetList = [];
        List<Widget> _list = [];
        for (Map _map in item) {
          _list.add(ExplosionItem(
            name: _map['username'],
            headPic: imageurlHeadGetBbsdetail + _map['avatar'],
            describe: _map['detail'],
            subList: _map['outBbsAttachList'],
          ));
        }
        if (_list.length == 0) {
          _list.add(
            Container(
              height: MediaQuery.of(context).size.height / 2,
              alignment: Alignment.center,
              child: Image.asset('assets/error503.png'),
            ),
          );
          _isPushEnable = false;
        } else {
          _isPushEnable = true;
        }
        setState(() {
          widgetList = _list;
        });
      });
    } else {
      apiGetBbsdetail(categoryid: widget.id).then((item) {
        List<Widget> _list = [];
        for (Map _map in item) {
          _list.add(ExplosionItem(
            name: _map['username'],
            headPic: imageurlHeadGetBbsdetail + _map['avatar'],
            describe: _map['detail'],
            subList: _map['outBbsAttachList'],
          ));
        }
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
      isPushEnable: _isPushEnable,
      // 简单的配置头部和底部的样式。
      defaultRefreshBoxTextColor: Color(0xff666666),
      defaultRefreshBoxBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
