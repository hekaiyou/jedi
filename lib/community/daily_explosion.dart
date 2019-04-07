import 'package:flutter/material.dart';
import 'package:jedi/shared/pulltore_fresh.dart';
import 'package:jedi/community/blocks/explosion_item.dart';

/// 自定义的每日爆款页面组件。
class DailyExplosionPage extends StatefulWidget {
  @override
  _DailyExplosionPageState createState() => _DailyExplosionPageState();
}

/// 与自定义的每日爆款页面组件关联的状态子类。
/// 自动保持活动客户端混合（`AutomaticKeepAliveClientMixin`）抽象类，
/// 为自动保持活动（`AutomaticKeepAlive`）的客户提供方便的方法，与State子类一起使用。
/// 可以避免作为父组件的标签栏视图（`TabBarView`）组件切换时被重新绘制。
class _DailyExplosionPageState extends State<DailyExplosionPage>
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
      fetchExplosion().then((item) {
        List<Widget> _list = item.map((Map map) {
          return ExplosionItem(
            name: map['name'],
            headPic: map['headPic'],
            describe: map['describe'],
            subList: map['subList'],
          );
        }).toList();
        setState(() {
          widgetList = _list;
        });
      });
    } else {
      fetchExplosion().then((item) {
        List<Widget> _list = item.map((Map map) {
          return ExplosionItem(
            name: map['name'],
            headPic: map['headPic'],
            describe: map['describe'],
            subList: map['subList'],
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
        "name": "家居达人Joy",
        "headPic": "http://images.huasheng100.com/public/1553909634426104.jpg",
        "describe":
            "【太力家居旗舰店】\n立体免抽真空压缩袋9件套\uD83D\uDE31\n无需抽气工具\uD83C\uDD92\n秒速压缩，科学防皱\n新型高分子材料\uD83C\uDF89\n安全不漏气\uD83C\uDD99\n轻松收纳冬被羽绒服！\n\uD83D\uDCB0券后59.9元九件套\uD83D\uDCB0",
        "subList": [
          {
            "picUrl":
                "https://img.alicdn.com/i3/138960927/TB2XEE3e4tnkeRjSZSgXXXAuXXa_!!138960927.jpg_300x300.jpg",
            "earnMoney": 5.39,
            "isProduct": 1,
          },
        ],
        "comment": "【购买步骤】长按识别二维码—复制淘口令—点开【淘】领券下单"
      },
      {
        "name": "生活达人Tina",
        "headPic": "http://images.huasheng100.com/public/1553909452961565.jpg",
        "describe":
            "【富光明霞专卖店】\n富光经典水杯\uD83D\uDC9D\n隔热防烫防摔耐磨\uD83C\uDD99\n经久耐用防爆裂\uD83D\uDE49\n优质高硼硅玻璃✅\n杯体通透\uD83C\uDD92多色可选！\n券后仅19.9元",
        "subList": [
          {
            "picUrl":
                "https://img.alicdn.com/i3/2925060111/O1CN011CgsPnJVb4Sf7tc_!!2925060111.jpg",
            "earnMoney": 1.79,
            "isProduct": 1,
          },
          {
            "picUrl":
                "https://img.alicdn.com/bao/uploaded/i2/2261828207/O1CN01i5FjC52AUr0B8ucAU_!!0-item_pic.jpg",
            "earnMoney": 2.68,
            "isProduct": 0,
          },
          {
            "picUrl":
                "https://img.alicdn.com/i1/880734502/O1CN01dRZ3jT1j7xZ6j5y02_!!0-item_pic.jpg",
            "earnMoney": 2.68,
            "isProduct": 0,
          },
        ],
        "comment": "【购买步骤】长按识别二维码—复制淘口令—点开【淘】领券下单"
      },
      {
        "name": "家居达人原野",
        "headPic": "http://images.huasheng100.com/public/1553936922059423.png",
        "describe":
            "厨房新宠✌\n维艾不锈钢盆五件套\uD83E\uDD57\n优质不锈钢材质，加厚加深\n防摔耐用易清洗\uD83D\uDCAF\n厨房有它\uD83D\uDC47，全“盘”掌控！",
        "subList": [
          {
            "picUrl":
                "https://img.alicdn.com/i1/1697657691/TB2onrygcrI8KJjy0FhXXbfnpXa_!!1697657691.jpg",
            "earnMoney": 4.41,
            "isProduct": 0,
          },
          {
            "picUrl":
                "https://img.alicdn.com/bao/uploaded/i3/1997040162/O1CN016PjsUM1D4EfZUSqfV_!!0-item_pic.jpg",
            "earnMoney": 1.96,
            "isProduct": 0,
          },
          {
            "picUrl":
                "https://img.alicdn.com/i4/13795032018355873/T19pkdFhJfXXXXXXXX_!!0-item_pic.jpg",
            "earnMoney": 1.04,
            "isProduct": 1,
          },
          {
            "picUrl":
                "https://img.alicdn.com/bao/uploaded/i4/880734502/O1CN01hoGDM11j7xb5KQqxO_!!0-item_pic.jpg",
            "earnMoney": 1.04,
            "isProduct": 1,
          },
        ],
      },
    ];
  });
  return response;
}
