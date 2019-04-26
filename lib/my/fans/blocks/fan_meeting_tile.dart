import 'package:flutter/material.dart';

/// 自定义的粉丝见面会瓷砖组件。
class FanMeetingTile extends StatelessWidget {
  /// 粉丝的头像地址。
  final String headImage;

  /// 粉丝的昵称。
  final String name;

  /// 粉丝的手机号码。
  final String phone;

  /// 粉丝的关注时间。
  final String time;

  /// 粉丝是否是超级会员，默认为`false`。
  final bool member;

  FanMeetingTile({
    this.headImage,
    this.name,
    this.phone,
    this.time,
    this.member = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 容器（`Container`）组件的颜色（`color`）属性，通常用于设置背景色。
      color: Color(0xffFFFFFF),
      child: Column(
        children: <Widget>[
          // 列表瓷砖（`ListTile`）组件，单个固定高度的行，通常包含一些文本以及前导或尾随图标。
          ListTile(
            // 圆形剪裁（`ClipOval`）组件，通常用来裁剪头像图片。
            leading: ClipOval(
              child: Image.network(
                headImage,
                height: 36.0,
                width: 36.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 显示粉丝名称的文本（`Text`）组件。
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: 'PingFangMedium',
                    fontSize: 18.0,
                  ),
                ),
                // 判断当前粉丝是否超级会员。
                member
                    // 显示超级会员标示的容器（`Container`）组件。
                    ? Container(
                        height: 15.0,
                        width: 57.0,
                        margin: EdgeInsets.only(left: 3.0),
                        child: Image.asset('assets/super_member_logo.png'),
                      )
                    : SizedBox(),
              ],
            ),
            // 显示粉丝手机号码和关注日期的文本（`Text`）组件。
            subtitle: Text(
              phone + '   ' + time,
              style: TextStyle(
                color: Color(0xff999999),
                fontFamily: 'PingFangRegular',
                fontSize: 14.0,
              ),
            ),
          ),
          // 分隔（`Divider`）组件，1个像素高的水平线，两侧有填充。
          Divider(
            color: Color(0xffDDDDDD),
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
