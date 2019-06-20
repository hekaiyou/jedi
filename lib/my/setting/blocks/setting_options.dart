import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nautilus/nautilus.dart' as nautilus;

/// 自定义的设置选项组件。
class SettingOptions extends StatefulWidget {
  @override
  _SettingOptionsState createState() => _SettingOptionsState();
}

/// 与自定义的设置选项组件关联的状态子类。
class _SettingOptionsState extends State<SettingOptions> {
  /// 图片缓存的大小，以`MB`为单位。
  double currentSize = imageCache.currentSizeBytes / 1024 / 1024;

  /// 构建具体的操作行组件。
  Widget _buildOperationRow({String title, Widget child, Function callback}) {
    return GestureDetector(
      // 具体操作的细节，更新或跳转路由。
      onTap: callback,
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xffFFFFFF),
            alignment: Alignment.center,
            height: 49.0,
            // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 该操作对应功能的简述文字。
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff2B2F33),
                    fontFamily: 'PingFangRegular',
                    fontSize: 15.0,
                  ),
                ),
                // 后置组件区域。
                child != null
                    ? child
                    // 显示右箭头的图标，提示用户这里可以点击。
                    : Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xffD8D8D8),
                      ),
              ],
            ),
          ),
          // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
          Divider(
            color: Color(0xffE8EAED),
            height: 1.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildOperationRow(
          title: '昵称',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/my/setting/change_username');
          },
        ),
        _buildOperationRow(
          title: '我的标签',
          callback: () {
            print('我的标签');
          },
        ),
        _buildOperationRow(
          title: '淘宝授权',
          callback: () {
            nautilus.login().then((data) {
              if (data.isSuccessful) {
                nautilus.getUser().then((data) {
                  // pageUrl：页面地址；backUrl：返回地址；extParams：传递的临时参数；
                  // taoKeParams：传递的淘客参数；needPush：是否需要推送，仅适用于iOS；
                  // schemeType：方案类型，支持`tmall_scheme`和`taobao_scheme`，默认值为`tmall_scheme`；
                  // openType：打开类型；openNativeFailedMode：打开本机失败模式；
                  nautilus
                      .openUrl(
                    openType: nautilus.OpenType.H5,
                    pageUrl:
                        "https://oauth.taobao.com/authorize?response_type=code&client_id=25826707&redirect_uri=https://www.yujianshenghuo.com/api/auth_callback&state=1212&view=wap",
                  )
                      .then((onValue) {
                    print('服务器返回信息：');
                    print('*' * 10);
                    print(
                        'openResultCode：' + onValue.openResultCode.toString());
                    print('platform：' + onValue.platform.toString());
                    print('isSuccessful：' + onValue.isSuccessful.toString());
                    print('tradeResultType：' +
                        onValue.tradeResultType.toString());
                    print('paySuccessOrders' +
                        onValue.paySuccessOrders.toString());
                    print(
                        'payFailedOrders' + onValue.payFailedOrders.toString());
                    print('errorCode' + onValue.errorCode.toString());
                    print('errorMessage' + onValue.errorMessage.toString());
                    print('*' * 10);
                  });
                });
              } else {
                showDialog<Null>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        content: Text(
                          data.errorMessage,
                          style: TextStyle(
                            fontFamily: 'PingFangRegular',
                            fontSize: 15.0,
                          ),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('确定'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                //print('错误信息->${}');
              }
            });
          },
        ),
        _buildOperationRow(
          title: '支付宝绑定',
          callback: () {},
        ),
        _buildOperationRow(
          title: '微信绑定',
          callback: () {
            print('微信绑定');
          },
        ),
        _buildOperationRow(
          title: '修改手机号',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/my/setting/modify_phone');
          },
        ),
        _buildOperationRow(
          title: '修改密码',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/my/setting/change_password');
          },
        ),
        _buildOperationRow(
          title: '消息通知',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/my/setting/notification_settings');
          },
        ),
        _buildOperationRow(
          title: '清除缓存',
          // 显示清除按钮的容器（`Container`）组件。
          child: Container(
            alignment: Alignment.center,
            height: 27.0,
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
              // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
              // 边界（`Border`）类，框的边框，由四个边组成：顶部、右侧、底部、左侧。
              border: Border.all(
                // 宽度参数，边框的宽度。
                width: 1.0,
                // 颜色参数，边框的颜色。
                color: const Color(0xffFE823A),
              ),
              // 边界半径（`borderRadius`）属性，如果为非空值，则此属性将对此框的角进行舍入。
              // 边界半径（`BorderRadius`）类，矩形每个角的一组不可变半径。
              // 边界半径.所有（`BorderRadius.all`）构造函数，创建一个边界半径，设置所有的半径。
              borderRadius: BorderRadius.all(
                // 半径（`Radius`）类，圆形或椭圆形的半径。
                // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
                Radius.circular(14.0),
              ),
            ),
            child: Text(
              // 字符串为固定（`toStringAsFixed`）方法，返回保留几位小数的字符串。
              '清除' + currentSize.toStringAsFixed(1) + 'M',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xffFE823A),
                fontFamily: 'PingFangRegular',
              ),
            ),
          ),
          callback: () {
            // 清理图片缓存。
            imageCache.clear();
            showDialog<Null>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  content: Text(
                    '清除成功',
                    style: TextStyle(
                      fontFamily: 'PingFangRegular',
                      fontSize: 15.0,
                    ),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('确定'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            setState(() {
              currentSize = imageCache.currentSizeBytes / 1024 / 1024;
            });
          },
        ),
      ],
    );
  }
}
