import 'package:flutter/material.dart';
import 'package:jedi/home/classification/blocks/classification_list_tile.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/home/classification/blocks/sort_operation.dart';

/// 自定义的分类商品页面组件。
class ClassificationPage extends StatefulWidget {
  final String typeName;

  ClassificationPage({
    this.typeName,
  });

  @override
  _ClassificationPageState createState() => _ClassificationPageState();
}

/// 与自定义的分类商品组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的标签栏视图（`TabBarView`）组件切换时被重新绘制。
class _ClassificationPageState extends State<ClassificationPage>
    with AutomaticKeepAliveClientMixin {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  /// 排序设置，可以在这里设置默认排序。
  String sortSet = '';

  /// 总结果数，用于计算分页。
  int totalResults = 0;

  /// 当前页数。
  int pagenoNum = 0;

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

  void _sortCallback(String sort) {
    totalResults = 0;
    sortSet = sort;
    widgetList = [
      SortOperation(
        sortCallback: _sortCallback,
      ),
    ];
    _taobaoMaterialOptional();
  }

  void _taobaoMaterialOptional() {
    apiTaobaoMaterialOptional(
      typeid: 0,
      q: widget.typeName,
      pagesize: 20,
      pageno: pagenoNum,
      sort: sortSet,
    ).then((_list) {
      if (totalResults == 0) {
        totalResults = _list['totalResults'];
        pagenoNum = 0;
      }
      for (Map _hotMap in _list['outMaterialDetailList']) {
        widgetList.add(ClassificationListTile(
          // itemId: _hotMap['itemId'],
          // isselfupport: _hotMap['isselfupport'],
          picturl: _hotMap['isselfupport'] == "2"
              ? _hotMap['pictUrl']
              : imageurlHeadGoodsgroups + _hotMap['pictUrl'],
          // shortTitle: _hotMap['shortTitle'],
          // couponAmount: _hotMap['couponAmount'],
          // zkFinalPrice: _hotMap['zkFinalPrice'],
          // couponTotalCount: _hotMap['couponTotalCount'],
          // couponRemainCount: _hotMap['couponRemainCount'],
          // shopTitle: _hotMap['shopTitle'],
          // smallImages: _hotMap['smallImages'],
          title: _hotMap['title'],
          // couponShareUrl: _hotMap['couponShareUrl'],
        ));
      }
      setState(() {});
    });
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      totalResults = 0;
      widgetList = [
        SortOperation(
          sortCallback: _sortCallback,
        ),
      ];
      _taobaoMaterialOptional();
    } else {
      print(totalResults);
      print(pagenoNum);
      if (pagenoNum * 20 < totalResults) {
        pagenoNum += 1;
        _taobaoMaterialOptional();
      } else {
        setState(() {});
      }
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
