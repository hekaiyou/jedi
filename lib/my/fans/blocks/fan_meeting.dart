import 'package:flutter/material.dart';
import 'package:jedi/blocks/pulltore_fresh.dart';
import 'package:jedi/my/fans/blocks/fan_meeting_tile.dart';

/// 自定义的粉丝见面会组件。
class FanMeeting extends StatefulWidget {
  @override
  _FanMeetingState createState() => _FanMeetingState();
}

/// 与自定义的粉丝见面会组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的页面视图（`PageView`）组件切换时被重新绘制。
class _FanMeetingState extends State<FanMeeting>
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
          return FanMeetingTile(
            headImage: map['head'],
            name: map['name'],
            phone: map['phone'],
            time: map['time'],
            member: map['member'],
          );
        }).toList();
        setState(() {
          widgetList = _list;
        });
      });
    } else {
      fetchExplosion().then((item) {
        List<Widget> _list = item.map((Map map) {
          return FanMeetingTile(
            headImage: map['head'],
            name: map['name'],
            phone: map['phone'],
            time: map['time'],
            member: map['member'],
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
    return Column(
      children: <Widget>[
        Expanded(
          child: PullAndPush(
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
          ),
        ),
        // 显示超级会员数量的容器（`Container`）组件。
        Container(
          alignment: Alignment.center,
          color: Color(0xffFE823A),
          height: 49.0,
          child: Text(
            '超级会员：14位',
            style: TextStyle(
                fontFamily: 'PingFangMedium',
                fontSize: 18.0,
                color: Color(0xffF9F9F9)),
          ),
        ),
      ],
    );
  }
}

Future<List<Map>> fetchExplosion() async {
  final response = await Future.delayed(Duration(milliseconds: 50), () {
    return [
      {
        "head":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556184047169&di=27e1da59a49526f60557ea8baafe6d55&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201610%2F17%2F20161017144708_VLJYh.jpeg",
        "name": "醉态萌生",
        "phone": "150****0917",
        "time": "2019年03月05日",
        "member": true,
      },
      {
        "head":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556185760122&di=2598feffb0335a91896e7e07114e9232&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201706%2F22%2F20170622131955_h4eZS.thumb.700_0.jpeg",
        "name": "风雅中带野",
        "phone": "139****3453",
        "time": "2019年03月05日",
        "member": true,
      },
      {
        "head":
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2846223807,1214619332&fm=26&gp=0.jpg",
        "name": "望断归来路",
        "phone": "130****9324",
        "time": "2019年03月05日",
        "member": false,
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=298724022,2832904054&fm=26&gp=0.jpg",
        "name": "澄澈的眼",
        "phone": "193****2345",
        "time": "2019年03月05日",
        "member": false,
      },
      {
        "head":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1544450304,2345404395&fm=26&gp=0.jpg",
        "name": "和你遇见",
        "phone": "138****3452",
        "time": "2019年03月04日",
        "member": true,
      },
      {
        "head":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2365487321,533522151&fm=26&gp=0.jpg",
        "name": "嗑药仙子",
        "phone": "137****9984",
        "time": "2019年03月04日",
        "member": true,
      },
      {
        "head":
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556186212029&di=55a3a91906399b60e5591265e8b354fc&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F9cdf526564eb5b7299f45ab8460d5aadbdaee29c12d1c-eoxEAN_fw658",
        "name": "关于我的爱情",
        "phone": "138****9324",
        "time": "2019年03月04日",
        "member": false,
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2048148077,698541647&fm=26&gp=0.jpg",
        "name": "中国女孩",
        "phone": "138****6321",
        "time": "2019年03月04日",
        "member": true,
      },
      {
        "head":
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2545763052,1545852903&fm=26&gp=0.jpg",
        "name": "相思寄明月",
        "phone": "186****3542",
        "time": "2019年03月04日",
        "member": false,
      },
      {
        "head":
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2717178333,3060185055&fm=26&gp=0.jpg",
        "name": "旧城俨然回眸笑",
        "phone": "138****4963",
        "time": "2019年03月04日",
        "member": true,
      },
      {
        "head":
            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2873429284,1734668593&fm=26&gp=0.jpg",
        "name": "一叶知秋",
        "phone": "138****3245",
        "time": "2019年03月03日",
        "member": true,
      },
      {
        "head":
            "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1180427006,2868239390&fm=26&gp=0.jpg",
        "name": "Elizabeth II",
        "phone": "139****1456",
        "time": "2019年03月03日",
        "member": true,
      },
    ];
  });
  return response;
}
