import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// 自定义的细分项目类，包含自定义的精选细分组件需要的数据。
class SegmentItem {
  final String image;
  final String title;

  SegmentItem({
    this.image,
    this.title,
  });
}

/// 自定义的精选细分组件。
class FeaturedSegment extends StatelessWidget {
  /// 存储用于构建当前组件的细分项目列表。
  final List<SegmentItem> segment;

  FeaturedSegment({
    this.segment,
  });

  @override
  Widget build(BuildContext context) {
    // 存储用于列（`Column`）组件的行（`Row`）组件列表。
    List<Row> _columnRow = [];
    // 存储用于行（`Row`）组件的容器（`Container`）组件列表。
    List<Container> _rows = [];
    // 遍历细分项目列表。
    for (int i = 0; i < segment.length; i++) {
      // 控制每行只有5个细分项目。
      if ((i + 1) % 5 == 1) {
        _rows = [];
      }
      // 使用细分项目的数据构建容器（`Container`）组件。
      _rows.add(
        Container(
          width: 59.0,
          height: 67.0,
          margin: EdgeInsets.symmetric(
            vertical: 9.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: segment[i].image,
                height: 45.0,
                width: 45.0,
                fit: BoxFit.contain,
              ),
              Text(
                segment[i].title,
                style: TextStyle(
                  color: Color(0xff666666),
                  fontFamily: 'PingFangRegular',
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      );
      // 将1行5个容器（`Container`）组件作为子项构建列（`Column`）组件。
      if (_rows.length == 5) {
        _columnRow.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _rows,
          ),
        );
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.0,
      ),
      child: Column(
        children: _columnRow,
      ),
    );
  }
}
