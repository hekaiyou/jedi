import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jedi/my/blocks/setting_frame.dart';
import 'package:jedi/my/blocks/set_submit_button.dart';

/// 自定义的通知设置页面组件。
class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

/// 与自定义的通知设置页面组件关联的状态子类。
class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  /// 当前是否接收收益消息。
  bool _currentIncomeCheck = true;

  /// 当前是否接收新粉丝消息。
  bool _currentFanCheck = true;

  @override
  Widget build(BuildContext context) {
    return SettingFrame(
      title: '通知',
      children: <Widget>[
        Container(
          height: 49.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          margin: EdgeInsets.symmetric(vertical: 17.0),
          color: Color(0xffFFFFFF),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '接受消息通知',
                style: descriptiveTextStyle,
              ),
              // 用于提示当前用户是否开启接受消息通知的文本（`Text`）组件。
              Text(
                '已开启',
                style: TextStyle(
                  // 字体大小。
                  fontSize: 15.0,
                  // 字体系列。
                  fontFamily: 'PingFangRegular',
                  // 颜色。
                  color: const Color(0xFF333333),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          color: Color(0xffFFFFFF),
          child: Column(
            children: <Widget>[
              // 通过大小框（`SizedBox`）组件设置一个固定高度。
              SizedBox(
                height: 49.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '收益消息',
                      style: descriptiveTextStyle,
                    ),
                    // 库比蒂诺开关（`CupertinoSwitch`）组件，iOS风格的开关，
                    // 通常用于切换单个设置的开/关状态。
                    CupertinoSwitch(
                      // 值（`value`）属性，此开关是打开还是关闭。
                      value: _currentIncomeCheck,
                      // 激活颜色（`activeColor`）属性，此开关打开时使用的颜色。
                      activeColor: Color(0xffFE7C30),
                      // 在改变（`onChanged`）属性，当用户打开或关闭开关时调用。
                      onChanged: (bool val) {
                        setState(() {
                          _currentIncomeCheck = !_currentIncomeCheck;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // 通过大小框（`SizedBox`）组件设置一个固定高度。
              SizedBox(
                height: 49.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '新粉丝消息',
                      style: descriptiveTextStyle,
                    ),
                    // 库比蒂诺开关（`CupertinoSwitch`）组件，iOS风格的开关，
                    // 通常用于切换单个设置的开/关状态。
                    CupertinoSwitch(
                      // 值（`value`）属性，此开关是打开还是关闭。
                      value: _currentFanCheck,
                      // 激活颜色（`activeColor`）属性，此开关打开时使用的颜色。
                      activeColor: Color(0xffFE7C30),
                      // 在改变（`onChanged`）属性，当用户打开或关闭开关时调用。
                      onChanged: (bool val) {
                        setState(() {
                          _currentFanCheck = !_currentFanCheck;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SetSubmitButton(
          title: '确认修改',
          callback: () {
            print('确认修改');
          },
        ),
      ],
    );
  }
}
