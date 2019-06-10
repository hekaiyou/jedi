import 'package:flutter/material.dart';

/// 自定义的搜索项目组件。
class SearchItem extends StatelessWidget {
  final List<String> searchs;

  SearchItem({
    this.searchs,
  });

  @override
  Widget build(BuildContext context) {
    // 媒体查询数据（`MediaQueryData`）类的大小（`size`）属性，逻辑像素中的媒体大小，即屏幕的大小。
    // 当前的屏幕宽度。
    double contextWidth = MediaQuery.of(context).size.width - 28.0;
    // 准备显示在屏幕上的搜索项目行（`Row`）组件列表。
    List<Widget> searchRowList = [];
    // 当前累计的搜索项目宽度。
    double _temporaryWidth = 0.0;
    // 当前处理的行（`Row`）组件列表项。
    List<Widget> _temporaryRowList = [];
    for (String _search in searchs) {
      // double _zeroSpace = (_search.split(' ').length - 1) * 0.0;
      _temporaryWidth += (_search.length * 14.0) + 4.0;
      if (_temporaryWidth >= contextWidth) {
        searchRowList.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: _temporaryRowList,
          ),
        ));
        _temporaryRowList = [];
        _temporaryWidth = (_search.length * 14.0) + 4.0;
      }
      _temporaryRowList.add(
        GestureDetector(
          child: Container(
            // 填充（`padding`）属性，在装饰里面的空白空间，如果有的话，将子组件放在这个衬垫内。
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            margin: EdgeInsets.only(bottom: 7.0),
            width: (_search.length * 14.0) + 4.0,
            height: 26.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffE8E8E8),
              borderRadius: const BorderRadius.all(
                const Radius.circular(24.0),
              ),
            ),
            child: Text(
              _search,
              // 溢出的文本以省略号（`...`）显示。
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // 字体大小。
                fontSize: 14.0,
                // 字体系列。
                fontFamily: 'PingFangRegular',
              ),
            ),
          ),
          onTap: () {},
        ),
      );
    }
    if (_temporaryRowList.length != 0) {
      searchRowList.add(Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Row(
          children: _temporaryRowList,
        ),
      ));
    }
    return Column(
      children: searchRowList,
    );
  }
}
