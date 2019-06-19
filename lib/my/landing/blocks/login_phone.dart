import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jedi/my/blocks/set_submit_button.dart';
import 'package:jedi/internet/api_account.dart';
import 'package:flutter/cupertino.dart';

/// 自定义的手机登陆组件。
class LoginPhone extends StatefulWidget {
  /// 倒计时的秒数，设置60秒。
  final int countdown = 60;

  /// 文本域（`TextField`）组件使用的样式。
  final TextStyle _textFieldStyle = TextStyle(
    // 字体大小。
    fontSize: 14.0,
    // 颜色。
    color: const Color(0xff000000),
    fontFamily: 'PingFangRegular',
  );

  /// 输入装饰（`InputDecoration`）组件的提示样式（`hintStyle`）属性值。
  final TextStyle _hintStyle = TextStyle(
    fontSize: 14.0,
    color: const Color(0xff9F9EA8),
    fontFamily: 'PingFangRegular',
  );

  /// 验证码按钮可用时使用的字体样式。
  final TextStyle _availableStyle = TextStyle(
    // 字体大小。
    fontSize: 14.0,
    // 颜色。
    color: const Color(0xff000000),
    fontFamily: 'PingFangRegular',
  );

  /// 验证码按钮不可用时使用的样式。
  final TextStyle _unavailableStyle = TextStyle(
    // 字体大小。
    fontSize: 14.0,
    // 颜色。
    color: const Color(0xff9F9EA8),
    fontFamily: 'PingFangRegular',
  );

  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

/// 与自定义的手机登陆组件关联的状态子类。
class _LoginPhoneState extends State<LoginPhone> {
  /// 手机号文本字段的控制器。
  final _phoneController = TextEditingController();

  /// 验证码文本字段的控制器。
  final _codeController = TextEditingController();

  /// 发送验证码按钮是否可用。
  bool _codeAvailable = false;

  /// 登陆按钮是否可用。
  bool _loginAvailable = false;

  /// 倒计时的计时器。
  Timer _timer;

  /// 当前倒计时的秒数。
  int _seconds;

  /// 当前验证码按钮的字体样式。
  TextStyle inkWellStyle;

  /// 当前验证码按钮的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
    inkWellStyle = widget._unavailableStyle;
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.countdown;
        inkWellStyle = widget._availableStyle;
        setState(() {});
        return;
      }
      _seconds--;
      _verifyStr = '$_seconds' + '秒';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  /// 拿手机号码发送验证码。
  void _getVerifcode() {
    apiGetVerifcode().then((onValue) {
      print(onValue);
      showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Text(
              onValue.toString(),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 21.0,
            right: 21.0,
            top: 72.0,
            bottom: 16.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xffEFF1F5),
            borderRadius: BorderRadius.all(
              // 半径（`Radius`）类，圆形或椭圆形的半径。
              // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
              Radius.circular(3.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image.asset('assets/landing_phone.png'),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 8.0,
                    right: 16.0,
                  ),
                  child: TextField(
                    controller: _phoneController,
                    // 光标颜色属性，绘制光标时使用的颜色。
                    cursorColor: const Color(0xFFFE7C30),
                    // 光标宽度属性，光标的厚度，默认是2.0。
                    cursorWidth: 2.0,
                    // 样式属性，用于正在编辑的文本的样式。
                    style: widget._textFieldStyle,
                    // 键盘类型属性，用于编辑文本的键盘类型。
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      // 边框属性，装饰的容器周围绘制的形状。
                      border: InputBorder.none,
                      // 提示样式属性，用于提示文本（`hintText`）的样式。
                      hintStyle: widget._hintStyle,
                      // 提示文本属性，提示字段接受哪种输入的文本。
                      hintText: '请输入您的手机号',
                    ),
                    // 在改变属性，当正在编辑的文本发生更改时调用。
                    onChanged: (value) {
                      if (RegExp(r'1(3|4|5|6|7|8|9)\d{9}')
                              .hasMatch(value.trim()) &&
                          value.trim().length == 11) {
                        _codeAvailable = true;
                        inkWellStyle = widget._availableStyle;
                      } else {
                        inkWellStyle = widget._unavailableStyle;
                        _codeAvailable = false;
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 21.0,
            right: 21.0,
            bottom: 48.0,
          ),
          decoration: BoxDecoration(
            color: Color(0xffEFF1F5),
            borderRadius: BorderRadius.all(
              // 半径（`Radius`）类，圆形或椭圆形的半径。
              // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值。
              Radius.circular(3.0),
            ),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Image.asset('assets/login_verification_code.png'),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: TextField(
                    controller: _codeController,
                    // 光标颜色属性，绘制光标时使用的颜色。
                    cursorColor: const Color(0xFFFE7C30),
                    // 光标宽度属性，光标的厚度，默认是2.0。
                    cursorWidth: 2.0,
                    // 样式属性，用于正在编辑的文本的样式。
                    style: widget._textFieldStyle,
                    // 键盘类型属性，用于编辑文本的键盘类型。
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // 边框属性，装饰的容器周围绘制的形状。
                      border: InputBorder.none,
                      // 提示样式属性，用于提示文本（`hintText`）的样式。
                      hintStyle: widget._hintStyle,
                      // 提示文本属���，提示字段接受哪种输入的文本。
                      hintText: '请输入验证码',
                    ),
                    // 在改变属性，当正在编辑的文本发生更改时调用。
                    onChanged: (value) {
                      if ((value.trim().length == 6) &&
                          (RegExp(r'1(3|4|5|6|7|8|9)\d{9}')
                                  .hasMatch(_phoneController.text.trim()) &&
                              _phoneController.text.trim().length == 11)) {
                        _loginAvailable = true;
                      } else {
                        _loginAvailable = false;
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: (_seconds == widget.countdown) && _codeAvailable
                    ? () {
                        if (_timer == null) {
                          _startTimer();
                          inkWellStyle = widget._unavailableStyle;
                          _verifyStr = ' $_seconds' + '秒 ';
                          setState(() {});
                          _getVerifcode();
                        } else {
                          if (_timer.isActive) {
                            return;
                          } else {
                            _startTimer();
                            inkWellStyle = widget._unavailableStyle;
                            _verifyStr = ' $_seconds' + '秒 ';
                            setState(() {});
                            _getVerifcode();
                          }
                        }
                      }
                    : null,
                child: Container(
                  width: 98.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    // 框装饰（`BoxDecoration`）类的边界（`border`）属性，在背景颜色、渐变或图像上方绘制的边框。
                    // 边界（`Border`）类，框的边框，由��个边组成：顶部、右侧、底部、左侧。
                    border: Border.all(
                      // 宽度参数，边框的宽度。
                      width: 1.0,
                      // 颜色参数，边框的颜色。
                      color: const Color(0xff9F9EA8),
                    ),
                    borderRadius: BorderRadius.all(
                      // 半径（`Radius`）类，圆形或椭圆形的半径。
                      // 半径.圆（`Radius.circular`）构造函数，构造一个圆形半径，x和y将具有相同的半径值��
                      Radius.circular(3.0),
                    ),
                  ),
                  child: Text(
                    _verifyStr,
                    style: inkWellStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        SetSubmitButton(
          title: '登录',
          padding: EdgeInsets.only(
            left: 21.0,
            right: 21.0,
          ),
          callback: _loginAvailable
              ? () {
                  apiLogin(
                    mobile: _phoneController.text.trim(),
                    verifcode: _codeController.text.trim(),
                  ).then((onValue) {
                    print(onValue);
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          content: Text(
                            onValue.toString(),
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
                  });
                }
              : null,
        ),
      ],
    );
  }
}
