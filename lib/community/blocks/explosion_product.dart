import 'package:flutter/material.dart';
import 'package:jedi/community/blocks/explosion_item_image.dart';

/// 构建展示爆款产品的组件，根据产品数量不同给出不同的效果。
Widget explosionProduct(List<Map> subList) {
  // 如果只有一个商品。
  if (subList.length == 1) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: ExplosionItemImage(
            subItem: subList[0],
          ),
        ),
        Flexible(
          flex: 1,
          child: SizedBox(),
        )
      ],
    );
    // 如果有三个及以上的商品。
  } else if (subList.length >= 3) {
    // 当前行的第几项。
    int _currentLine = 0;
    // 临时存储用的行数据列表。
    List<Flexible> _currentRow = [];
    // 最终返回的行（`Row`）组件列表。
    List<Row> _currentColumn = [];
    subList.forEach((subItem) {
      _currentRow.add(
        Flexible(
          flex: 1,
          child: Padding(
            padding: _currentLine == 1
                // 如果是中间的图片，在两边填充。
                ? EdgeInsets.symmetric(
                    horizontal: 2.5,
                  )
                : EdgeInsets.only(
                    // 如果是右边的图片，在左边填充。
                    left: _currentLine == 2 ? 5.0 : 0.0,
                    // 如果是左边的图片，在右边填充。
                    right: _currentLine == 0 ? 5.0 : 0.0,
                  ),
            child: ExplosionItemImage(
              subItem: subItem,
            ),
          ),
        ),
      );
      _currentLine++;
      // 如果是当前行的第三个项目，汇总并清理一次。
      if (_currentLine == 3) {
        _currentColumn.add(
          Row(
            children: _currentRow,
          ),
        );
        _currentLine = 0;
        _currentRow = [];
      }
    });
    // 如果最后一组没有满三个的时候，填充空白的大小框（`SizedBox`）组件。
    if (_currentRow.length < 3) {
      for (int i = _currentRow.length; i < 3; i++) {
        _currentRow.add(
          Flexible(
            flex: 1,
            child: SizedBox(),
          ),
        );
      }
      // 添加最后一组行（`Row`）组件数据。
      _currentColumn.add(
        Row(
          children: _currentRow,
        ),
      );
    }
    return Column(
      children: _currentColumn,
    );
  }
  return SizedBox();
}
