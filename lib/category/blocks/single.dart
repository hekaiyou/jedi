import 'package:flutter/material.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/blocks/sort_operation.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/blocks/processing_sorting_style.dart';

/// 自定义的单分类页面组件。
class SinglePage extends StatefulWidget {
  /// 接受的参数列表。
  final Map parameter;

  SinglePage({
    this.parameter,
  });

  @override
  _SinglePageState createState() => _SinglePageState();
}

/// 与自定义的单分类页面组件关联的状态子类。
class _SinglePageState extends State<SinglePage> {
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

  /// 风格设置，可以在这里设置默认排序。
  int stypeSet = 0;

  /// 总结果数，用于计算分页。
  int totalResults = 0;

  /// 当前页数。
  int pagenoNum = 0;

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

  /// 自定义的排序操作组件需要的排序规则变更回调。
  void _sortCallback(String sort) {
    totalResults = 0;
    sortSet = sort;
    widgetList = [];
    _taobaoMaterialOptional(true);
  }

  /// 自定义的排序操作组件需要的项目风格变更回调。
  void _stypeCallback(int stype) {
    totalResults = 0;
    stypeSet = stype;
    widgetList = [];
    _taobaoMaterialOptional(false);
  }

  /// 请求通用搜索优惠劵接口，然后使用获取的数据添加列表视图（ListView）中要显示的数据。
  void _taobaoMaterialOptional(bool isJump) {
    apiTaobaoMaterialOptional(
      typeid: 0,
      q: widget.parameter['typeName'],
      pagesize: 20,
      pageno: pagenoNum,
      sort: sortSet,
    ).then((_list) {
      if (totalResults == 0) {
        totalResults = _list['totalResults'];
        pagenoNum = 0;
      }
      widgetList.addAll(processingSortingStyle(
        stype: stypeSet,
        hotMaps: _list['outGetMaterialDetailList'],
      ));
      // 如果需要调整到顶部。
      if (isJump) {
        controller.jumpTo(0.0);
      }
      // 更新状态使变更的内容生效。
      setState(() {});
    });
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      totalResults = 0;
      widgetList = [];
      _taobaoMaterialOptional(false);
    } else {
      if (pagenoNum * 20 < totalResults) {
        pagenoNum += 1;
        _taobaoMaterialOptional(false);
      } else {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: const Color(0xffFFFFFF),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 应用栏（`AppBar`）中显示的主要组件。
        title: Text(
          widget.parameter['typeName'],
          style: TextStyle(
            fontFamily: 'PingFangBold',
            color: Color(0xff333333),
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff333333),
        ),
        // 底部（`bottom`）属性，此组件显示在应用栏的底部。
        // 首选大小（`PreferredSize`）组件，具有首选大小，它不会对其子项施加任何约束，也不会以任何方式影响子项的布局。
        // 它只是宣传了父级组件可以使用的首选大小。
        bottom: PreferredSize(
          child: SortOperation(
            topHeight: 79.0,
            hight: 0.0,
            controller: controller,
            sortCallback: _sortCallback,
            stypeCallback: _stypeCallback,
          ),
          // 首选大小（`preferredSize`）属性，如果它不受限制，这个组件会更喜欢它的大小。
          preferredSize: Size.fromHeight(24.0),
        ),
      ),
      body: PullAndPush(
        // 简单的配置头部和底部的样式。
        defaultRefreshBoxTextColor: Color(0xff666666),
        defaultRefreshBoxBackgroundColor: Color(0xffFFFFFF),
        // 可通过此对象的方法调用触发下拉刷新。
        triggerPullController: triggerPullController,
        // 用于上下拉的滑动控件。
        listView: ListView.builder(
          itemExtent: stypeSet == 0 ? 130.0 : 270.0,
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
      ),
    );
  }
}
