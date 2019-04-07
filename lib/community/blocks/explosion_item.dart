import 'package:flutter/material.dart';
import 'package:jedi/community/blocks/explosion_product.dart';

/// 自定义的每日爆款项目组件。
class ExplosionItem extends StatelessWidget {
  /// 用户名称。
  final String name;

  /// 用户头像。
  final String headPic;

  /// 商品描述信息。
  final String describe;

  /// 商品列表，包含图片、预估收益等信息。
  final List<Map> subList;

  ExplosionItem({
    this.name,
    this.headPic,
    this.describe,
    this.subList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 通过边沿（`margin`）属性，在顶部和底部制造分割效果。
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 6.0,
      ),
      // 填充（`padding`）属性，在周围制造留白效果。
      padding: EdgeInsets.all(14.0),
      color: Color(0xffFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 显示用户头像和名称的行（`Row`）组件。
              Row(
                children: <Widget>[
                  // 剪辑椭圆形（`ClipOval`）组件，使用椭圆剪辑其子项的组件。
                  ClipOval(
                    child: Image.network(
                      headPic,
                      height: 36.0,
                      width: 36.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  // 显示用户名称的文本（`Text`）组件。
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: 'PingFangMedium',
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              // 用容器（`Container`）组件实现的分享操作按钮。
              Container(
                height: 24.0,
                width: 51.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/community_sharing.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  '分享',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'PingFangMedium',
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
          // 显示商品描述信息的容器（`Container`）组件。
          Container(
            padding: EdgeInsets.only(
              top: 16.0,
              bottom: 8.0,
            ),
            child: Text(
              describe,
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: 'PingFangRegular',
                fontSize: 14.0,
              ),
            ),
          ),
          explosionProduct(subList),
        ],
      ),
    );
  }
}
