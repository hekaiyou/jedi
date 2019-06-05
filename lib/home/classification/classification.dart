import 'package:flutter/material.dart';
import 'package:jedi/home/classification/blocks/classification_segment.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/home/classification/blocks/processing_sorting_style.dart';
import 'package:jedi/home/classification/blocks/sort_operation.dart';
import 'package:jedi/home/classification/blocks/classified_ads_indicator.dart';

/// 自定义的分类商品页面组件。
class ClassificationPage extends StatefulWidget {
  /// 分类名称，用于接口请求参数。
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
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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

  /// 当前页面的分类项目。
  Widget classificationSegment;

  /// 顶部裂片的高度。
  double expandedHeight = 192.0;

  /// 细分项目列表。
  List<SegmentItem> segment = [];

  /// 图片列表，运营位图片列表。
  List<List<String>> imgList = [
    [
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552850106279&di=66945cb570b8b229ef2cd44439f29191&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170916%2Fa941249e25e8495e81ff845b53a0a631.gif',
      ''
    ],
    [
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552849040492&di=466f5b51f52223e7855a60c522f9caed&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F51%2F77%2F175ae675f513899.jpg',
      ''
    ],
    [
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552848913675&di=27dcd7c44c7f26207b62f77cb1bd3c0d&imgtype=0&src=http%3A%2F%2Fpic.90sjimg.com%2Fdesign%2F00%2F66%2F06%2F05%2Fe348ca963a431520d0b6898dffd47fe4.jpg',
      ''
    ],
  ];

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
    int ie = 0;
    // 获取初始化时获取的分类信息，然后执行遍历操作。
    for (Map _map in goodscategoryList) {
      if (_map['categoryname'] == widget.typeName) {
        for (Map _child in _map['childsOutGoodsCategory']) {
          ie++;
          segment.add(SegmentItem(
            image: imageurlHeadGoodscategory + _child['categoryimage'],
            title: _child['categoryname'],
          ));
        }
      }
    }
    classificationSegment = ClassificationSegment(segment: segment);
    if (ie > 5) {
      expandedHeight += 85.0 * (ie ~/ 5);
    } else {
      // 如果分类内容不足，就不显示自定义的分类商品细分组件。
      classificationSegment = SizedBox();
    }
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
      q: widget.typeName,
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
        controller.jumpTo(expandedHeight - 32.0);
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
      listView: CustomScrollView(
        controller: controller,
        physics: scrollPhysics,
        slivers: <Widget>[
          // 裂片应用栏（`SliverAppBar`）组件，与自定义滚动视图（`CustomScrollView`）组件集成的应用栏。
          SliverAppBar(
            backgroundColor: Color(0xffFFFFFF),
            // 浮动（`floating`）属性，滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，
            // 为`true`是隐藏，为`false`（默认）是不隐藏。
            floating: false,
            // 固定（`pinned`）属性，是否固定导航栏，为`true`是固定，为`false`（默认）是不固定，往上滑，导航栏可以隐藏。
            pinned: true,
            // 只跟浮动（`floating`）属性相对应，如果为`true`，浮动（`floating`）属性必须为`true`，
            // 也就是向下滑动一点儿，整个大背景就会动画显示全部，往上滑动整个导航栏的内容就会消失。
            snap: false,
            expandedHeight: expandedHeight,
            // 灵活的空间（`flexibleSpace`）属性，堆叠在工具栏和标签栏后面，它的高度��应用栏的整体高度相同。
            // 灵活的空间栏（`FlexibleSpaceBar`）组件，可以扩展和折叠的应用栏子组件。
            flexibleSpace: FlexibleSpaceBar(
              // 背景（`background`）属性，展开后显示在标题后面�����
              background: Column(
                children: <Widget>[
                  ClassifiedAdsIndicator(imgList: imgList),
                  classificationSegment,
                ],
              ),
              // 折叠模式（`collapseMode`）属性，滚动时折叠效果。
              collapseMode: CollapseMode.parallax,
            ),
            // 底部（`bottom`）属性，此组件显示在应用栏的底部。
            // 首选大小（`PreferredSize`）组件，具有首选大小，它不会对其子项施加任何约束，也不会以任何方式影响子项的布局。
            // 它只是宣传了父级组件可以使用���首选大小。
            bottom: PreferredSize(
              child: SortOperation(
                hight: expandedHeight,
                controller: controller,
                sortCallback: _sortCallback,
                stypeCallback: _stypeCallback,
              ),
              // 首选大���（`preferredSize`）属性，如果它不受限制，这个组件��更喜欢它的大小。
              preferredSize: Size.fromHeight(-24.0),
            ),
          ),
          // 裂片固定范围列表（`SliverFixedExtentList`）组件，沿着滚动轴具有相同范围的子项的线性列表。
          SliverFixedExtentList(
            itemExtent: stypeSet == 0 ? 130.0 : 270.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return widgetList[index];
              },
              childCount: widgetList.length,
            ),
          ),
        ],
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
