import 'package:flutter/material.dart';
import 'package:jedi/my/blocks/common_operation.dart';
import 'package:jedi/my/blocks/activity_banner.dart';
import 'package:jedi/my/blocks/operation_list.dart';
import 'package:jedi/my/blocks/my_information.dart';

/// 自定义的我的页面组件。
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

/// 与自定义的收益页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  ScrollController controller = ScrollController();

  /// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类的想要保持活动（`wantKeepAlive`）属性，
  /// 用于设置当前实例是否应保持活动状态（不因父组件的切换而重新绘制）。
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          // 媒体查询数据（`MediaQueryData`）类的大小（`size`）属性，逻辑像素中的媒体大小，即屏幕的大小。
          // 媒体查询数据（`MediaQueryData`）类的填充（`padding`）属性，应用程序可以呈现的显示矩形每一侧的物理像素数。
          // 填充（`padding`）属性的顶部（`top`）值是状态栏高度，底部（`bottom`）值是系统操作栏高度。
          height: MediaQuery.of(context).padding.top < 18
              ? 211.0 + MediaQuery.of(context).padding.top
              : 211.0 + MediaQuery.of(context).padding.top - 18,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/my_backboard.png',
                  fit: BoxFit.fill,
                  // 根据系统操作栏高度自动调整背景图片的高度。
                  height: MediaQuery.of(context).padding.top < 18
                      ? 177.0 + MediaQuery.of(context).padding.top
                      : 177.0 + MediaQuery.of(context).padding.top - 18,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CommonOperation(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: MyInformation(),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: controller,
            // 设置列表视图周围的填充，避免影响布局效果。
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              ActivityBanner(),
              OperationList(),
            ],
          ),
        ),
      ],
    );
  }
}
