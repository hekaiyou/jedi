import 'package:flutter/material.dart';
import 'package:jedi/category/flash/blocks/flash_featured_item.dart';

/// 自定义的品牌闪购组件。
class FlashFeaturedBrand extends StatelessWidget {
  /// 从服务器获取的品牌闪购数据。
  final List<FlashFeaturedItem> flashData;

  FlashFeaturedBrand({
    this.flashData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          color: Color(0xffFFFFFF),
          height: 152.0,
          width: double.infinity,
          // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
          child: ClipRRect(
            // 边界半径（`borderRadius`）属性，圆角的边界半径。
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557744006619&di=d376d9b55acaab9312c4fbe95b65c570&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F9%2F5450ae2fdef8a.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 单个组件滚动视图（`SingleChildScrollView`）组件。
        // 可以滚动单个组件的框，当有一个完全可见的单个框时，此组件非常有用。
        // 例如时间选择器中的时钟面，但如果容器在一个轴上太小，则需要确保它可以滚动。
        SingleChildScrollView(
          // 滚动方向（`scrollDirection`）属性，滚动视图滚动的轴方向。
          scrollDirection: Axis.horizontal,
          // 填充（`padding`）属性，插入子组件的空间量。
          padding: EdgeInsets.symmetric(
            horizontal: 11.0,
          ),
          child: Row(
            children: flashData.map((FlashFeaturedItem flashItem) {
              return flashItem;
            }).toList(),
          ),
        ),
      ],
    );
  }
}
