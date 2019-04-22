import 'package:flutter/material.dart';

/// 自定义的设置选项组件。
class SettingOptions extends StatelessWidget {
  /// 构建具体的操作行组件。
  Widget _buildOperationRow({String title, Widget child, Function callback}) {
    return GestureDetector(
      // 具体操作的细节，更新或跳转路由。
      onTap: callback,
      child: Column(
        children: <Widget>[
          Container(
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
            Navigator.pushNamed(context, '/setting/change_username');
          },
        ),
        _buildOperationRow(
          title: '我的标签',
          callback: () {
            print('我的标签');
          },
        ),
        _buildOperationRow(
          title: '支付宝绑定',
          callback: () {
            print('支付宝绑定');
          },
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
            Navigator.pushNamed(context, '/setting/modify_phone');
          },
        ),
        _buildOperationRow(
          title: '修改密码',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/setting/change_password');
          },
        ),
        _buildOperationRow(
          title: '消息通知',
          callback: () {
            // 使用命名路由导航到第二个屏幕。
            Navigator.pushNamed(context, '/setting/notification_settings');
          },
        ),
        _buildOperationRow(
          title: '清除缓存',
          // 显示清除按钮的容器（`Container`）组件。
          child: Container(
            alignment: Alignment.center,
            width: 58.0,
            height: 27.0,
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
              '清除',
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xffFE823A),
                fontFamily: 'PingFangRegular',
              ),
            ),
          ),
          callback: () {
            print('清除缓存');
          },
        ),
      ],
    );
  }
}
