import 'package:flutter/material.dart';
import 'package:jedi/home/featured/blocks/activity_bar.dart';
import 'package:jedi/home/blocks/featured_segment.dart';
import 'package:jedi/home/featured/blocks/featured_headlines.dart';
import 'package:jedi/home/featured/blocks/large_poster.dart';
import 'package:jedi/home/featured/blocks/hot_list.dart';
import 'package:jedi/home/featured/blocks/recommend_you.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/internet/api_navigation.dart';
import 'package:jedi/blocks/recommend_you_item.dart';

/// 自定义的精选页面组件。
class FeaturedPage extends StatefulWidget {
  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

/// 与自定义的精选页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的标签栏视图（`TabBarView`）组件切换时被重新绘制。
class _FeaturedPageState extends State<FeaturedPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  /// 列表视图（`ListView`）中要显示的数据。
  List<Widget> widgetList = [];

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 滚动物理（`ScrollPhysics`）类，确定滚动组件的物理特性。
  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  /// 通过按钮等其他方式，通过方法调用触发下拉刷新。
  TriggerPullController triggerPullController = TriggerPullController();

  /// 总结果数，用于计算分页。
  int totalResults = 0;

  /// 当前页数。
  int pagenoNum = 0;

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

  /// 构建列表视图（`ListView`）中要显示的初始化或常驻内容。
  List<Widget> _buildResidentData({
    List<List<String>> imgList,
    List<SegmentItem> segment,
    List<List<String>> headlines,
    List<String> posterPicture,
    List<HotItem> hotData,
  }) {
    return <Widget>[
      ActivityBar(imgList: imgList),
      segment.length != 0 ? FeaturedSegment(segment: segment) : SizedBox(),
      segment.length != 0
          ? Divider(
              height: 1.0,
              color: Color(0xffE2E2E2),
            )
          : SizedBox(),
      headlines.length != 0
          ? FeaturedHeadlines(headlines: headlines)
          : SizedBox(),
      headlines.length != 0
          ? Container(
              height: 10.0,
              color: Color(0xffF6F6F6),
            )
          : SizedBox(),
      posterPicture.length != 0
          ? LargePoster(posterPicture: posterPicture)
          : SizedBox(),
      posterPicture.length != 0
          ? Container(
              height: 10.0,
              color: Color(0xffF6F6F6),
            )
          : SizedBox(),
      HotList(
        hotData: hotData,
      ),
      Container(
        height: 10.0,
        color: Color(0xffF6F6F6),
      ),
      RecommendYouTitle(),
    ];
  }

  void _taobaoMaterialOptional() {
    apiTaobaoMaterialOptional(
      typeid: 0,
      q: '为你推荐',
      pagesize: 20,
      pageno: pagenoNum,
    ).then((_list) {
      if (totalResults == 0) {
        totalResults = _list['totalResults'];
        pagenoNum = 0;
      }
      // 每行可以显示的数量。
      int rowNum = 2;
      // 当前行已经有多少组件。
      int _row = 0;
      // 包装在灵活（`Flexible`）组件里的容器（`Container`）组件列表。
      // 临时存储当前行的数据，最大行数满了就清理一次。
      List<Flexible> _columnList = [];
      for (Map _hotMap in _list['outGetMaterialDetailList']) {
        _columnList.add(
          // 控制行（`Row`）、列（`Column`）或柔性（`Flex`）的子项如何灵活放置的组件。
          Flexible(
            // 柔性（`flex`）属性，用于这个子组件的弹性因子。
            flex: 1,
            child: RecommendYouItem(
              row: _row,
              recommendItem: RecommendItem(
                itemId: _hotMap['itemId'],
                title: _hotMap['title'],
                picturl: _hotMap['isselfupport'] == "2"
                    ? _hotMap['pictUrl']
                    : imageurlHeadGoodsgroups + _hotMap['pictUrl'],
                isselfupport: _hotMap['isselfupport'],
                userType: _hotMap['userType'],
                rebatePrice: double.parse(_hotMap['zkFinalPrice']) -
                    double.parse(_hotMap['couponAmount']),
                commissionRate: _hotMap['commissionRate'],
                couponAmount: _hotMap['couponAmount'],
                zkFinalPrice: _hotMap['zkFinalPrice'],
                couponTotalCount: _hotMap['couponTotalCount'],
                smallImages: _hotMap['smallImages'],
                couponRemainCount: _hotMap['couponRemainCount'],
                shopTitle: _hotMap['shopTitle'],
                couponShareUrl: _hotMap['couponShareUrl'],
              ),
            ),
          ),
        );
        // 当前行数执行自加操作。
        _row++;
        // 当前行数等于每行最大可以显示的数量时，将数据添加进返回的数据列表，同时清理临时数据列表。
        if (_row == rowNum) {
          widgetList.add(
            Container(
              color: Color(0xffFFFFFF),
              padding: EdgeInsets.only(
                top: 6.0,
                left: 13.0,
                right: 13.0,
                bottom: 6.0,
              ),
              child: Row(
                children: _columnList,
              ),
            ),
          );
          _columnList = [];
          _row = 0;
        }
      }
      setState(() {});
    });
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      apiGetGetPagelayout(categoryid: 1).then((_map) {
        List<List<String>> imgList = [];
        List<SegmentItem> segment = [];
        List<List<String>> headlines = [];
        List<String> posterPicture = [];
        List<HotItem> hotData = [];
        for (Map amap in _map) {
          if (amap['type'] == '1') {
            imgList.add(
              [imageurlHeadPagelayout + amap['layoutimage'], amap['clickurl']],
            );
          } else if (amap['type'] == '2') {
            segment.add(
              SegmentItem(
                image: imageurlHeadPagelayout + amap['layoutimage'],
                title: amap['text'],
              ),
            );
          } else if (amap['type'] == '3') {
            headlines.add([amap['text']]);
          } else if (amap['type'] == '4') {
            posterPicture.add(imageurlHeadPagelayout + amap['layoutimage']);
          }
        }
        apiTaobaoMaterialOptional(typeid: 0, q: '热销榜单').then((_list) {
          for (Map _hotMap in _list['outGetMaterialDetailList']) {
            hotData.add(
              HotItem(
                itemId: _hotMap['itemId'],
                isselfupport: _hotMap['isselfupport'],
                picturl: _hotMap['isselfupport'] == "2"
                    ? _hotMap['pictUrl']
                    : imageurlHeadGoodsgroups + _hotMap['pictUrl'],
                shortTitle: _hotMap['shortTitle'],
                couponAmount: _hotMap['couponAmount'],
                zkFinalPrice: _hotMap['zkFinalPrice'],
                couponTotalCount: _hotMap['couponTotalCount'],
                couponRemainCount: _hotMap['couponRemainCount'],
                shopTitle: _hotMap['shopTitle'],
                smallImages: _hotMap['smallImages'],
                title: _hotMap['title'],
                couponShareUrl: _hotMap['couponShareUrl'],
              ),
            );
          }
          widgetList = [];
          setState(() {
            _isPushEnable = true;
            widgetList = _buildResidentData(
              imgList: imgList,
              segment: segment,
              headlines: headlines,
              posterPicture: posterPicture,
              hotData: hotData,
            );
          });
          totalResults = 0;
          _taobaoMaterialOptional();
        });
      });
    } else {
      if (pagenoNum * 20 < totalResults) {
        pagenoNum += 1;
        _taobaoMaterialOptional();
      } else {
        setState(() {
          _isPushEnable = false;
        });
      }
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
