import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors/sensors.dart';
import 'package:flutter/cupertino.dart';
import 'package:jedi/internet/internet.dart';

/// 自定义的关于页面组件。
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

/// 与自定义的关于页面组件关联的状态子类。
class _AboutPageState extends State<AboutPage> {
  /// 是否已经显示摇一摇弹窗。
  bool isShow = false;

  /// 自定义主机环境的输入框。
  TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // 摇一摇阀值,不同手机能达到的最大值不同，如某品牌手机只能达到20。
      int value = 20;
      if (event.x >= value ||
          event.x <= -value ||
          event.y >= value ||
          event.y <= -value ||
          event.z >= value ||
          event.z <= -value) {
        if (isShow == false) {
          isShow = true;
          showDialog<bool>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('环境自定义'),
                content: Material(
                  child: TextField(
                    controller: _urlController,
                    keyboardType: TextInputType.url,
                    // 装饰（`decoration`）属性，在文本字段周围显示的装饰。
                    // 输入装饰（`InputDecoration`）组件。
                    decoration: InputDecoration(
                      // 提示文本属性，提示字段接受哪种输入的文本。
                      hintText: 'https://www.y~o.com/api',
                    ),
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text('确定'),
                    onPressed: () {
                      setDioUrl(_urlController.text.trim());
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          ).then((onValue) {
            if (onValue != null) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            }
            isShow = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 中心标题（`centerTitle`）属性，标题是否显示在应用栏中间。
        centerTitle: true,
        // 背景色（`backgroundColor`）属性，用于应用栏材质的颜色。
        backgroundColor: Color(0xffFFFFFF),
        // 亮度（`brightness`）属性，应用栏材质的亮度。
        brightness: Brightness.light,
        // 图标主题（`iconTheme`）属性，用于应用栏图标的颜色，不透明度和大小。
        iconTheme: IconThemeData(),
        // 海拔（`elevation`）属性，将此应用栏相对于其父级放置的z坐标。
        elevation: 1.0,
        // 标题（`title`）属性，应用栏的主要组件。
        title: Text(
          '关于',
          style: TextStyle(
            color: Color(0xff000000),
            fontFamily: 'PingFangMedium',
          ),
        ),
      ),
    );
  }
}
