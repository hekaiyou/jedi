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
    // 当前的屏幕宽度减去2边距离后。
    double contextWidth = MediaQuery.of(context).size.width - 28.0;
    // 准备显示在屏幕上的搜索项目（`Widget`）组件列表。
    List<Widget> searchRowList = [];
    // 当前累计的搜索项目宽度。
    double _temporaryWidth = 0.0;
    // 当前处理的行（`Row`）组件列表项。
    List<Widget> _temporaryRowList = [];
    // 当前具体显示组件的框度。
    double _widgetWidth = 0.0;
    // 当前具体显示组件的左边距离。
    double _widgetLeft = 0.0;
    for (String _search in searchs) {
      double _azwd = 4.0;
      double _intwd = 4.0;
      double _aZwd = 3.0;
      double _zeroSpace = (_search.split(' ').length - 1) * 2.0;
      _zeroSpace += (_search.split('q').length - 1) * _azwd;
      _zeroSpace += (_search.split('w').length - 1) * _azwd;
      _zeroSpace += (_search.split('e').length - 1) * _azwd;
      _zeroSpace += (_search.split('r').length - 1) * _azwd;
      _zeroSpace += (_search.split('t').length - 1) * _azwd;
      _zeroSpace += (_search.split('y').length - 1) * _azwd;
      _zeroSpace += (_search.split('u').length - 1) * _azwd;
      _zeroSpace += (_search.split('i').length - 1) * _azwd;
      _zeroSpace += (_search.split('o').length - 1) * _azwd;
      _zeroSpace += (_search.split('p').length - 1) * _azwd;
      _zeroSpace += (_search.split('a').length - 1) * _azwd;
      _zeroSpace += (_search.split('s').length - 1) * _azwd;
      _zeroSpace += (_search.split('d').length - 1) * _azwd;
      _zeroSpace += (_search.split('f').length - 1) * _azwd;
      _zeroSpace += (_search.split('g').length - 1) * _azwd;
      _zeroSpace += (_search.split('h').length - 1) * _azwd;
      _zeroSpace += (_search.split('j').length - 1) * _azwd;
      _zeroSpace += (_search.split('k').length - 1) * _azwd;
      _zeroSpace += (_search.split('l').length - 1) * _azwd;
      _zeroSpace += (_search.split('z').length - 1) * _azwd;
      _zeroSpace += (_search.split('x').length - 1) * _azwd;
      _zeroSpace += (_search.split('c').length - 1) * _azwd;
      _zeroSpace += (_search.split('v').length - 1) * _azwd;
      _zeroSpace += (_search.split('b').length - 1) * _azwd;
      _zeroSpace += (_search.split('n').length - 1) * _azwd;
      _zeroSpace += (_search.split('m').length - 1) * _azwd;
      _zeroSpace += (_search.split('0').length - 1) * _intwd;
      _zeroSpace += (_search.split('1').length - 1) * _intwd;
      _zeroSpace += (_search.split('2').length - 1) * _intwd;
      _zeroSpace += (_search.split('3').length - 1) * _intwd;
      _zeroSpace += (_search.split('4').length - 1) * _intwd;
      _zeroSpace += (_search.split('5').length - 1) * _intwd;
      _zeroSpace += (_search.split('6').length - 1) * _intwd;
      _zeroSpace += (_search.split('7').length - 1) * _intwd;
      _zeroSpace += (_search.split('8').length - 1) * _intwd;
      _zeroSpace += (_search.split('9').length - 1) * _intwd;
      _zeroSpace += (_search.split('Q').length - 1) * _aZwd;
      _zeroSpace += (_search.split('W').length - 1) * _aZwd;
      _zeroSpace += (_search.split('E').length - 1) * _aZwd;
      _zeroSpace += (_search.split('R').length - 1) * _aZwd;
      _zeroSpace += (_search.split('T').length - 1) * _aZwd;
      _zeroSpace += (_search.split('Y').length - 1) * _aZwd;
      _zeroSpace += (_search.split('U').length - 1) * _aZwd;
      _zeroSpace += (_search.split('I').length - 1) * _aZwd;
      _zeroSpace += (_search.split('O').length - 1) * _aZwd;
      _zeroSpace += (_search.split('P').length - 1) * _aZwd;
      _zeroSpace += (_search.split('A').length - 1) * _aZwd;
      _zeroSpace += (_search.split('S').length - 1) * _aZwd;
      _zeroSpace += (_search.split('D').length - 1) * _aZwd;
      _zeroSpace += (_search.split('F').length - 1) * _aZwd;
      _zeroSpace += (_search.split('G').length - 1) * _aZwd;
      _zeroSpace += (_search.split('H').length - 1) * _aZwd;
      _zeroSpace += (_search.split('J').length - 1) * _aZwd;
      _zeroSpace += (_search.split('K').length - 1) * _aZwd;
      _zeroSpace += (_search.split('L').length - 1) * _aZwd;
      _zeroSpace += (_search.split('Z').length - 1) * _aZwd;
      _zeroSpace += (_search.split('X').length - 1) * _aZwd;
      _zeroSpace += (_search.split('C').length - 1) * _aZwd;
      _zeroSpace += (_search.split('V').length - 1) * _aZwd;
      _zeroSpace += (_search.split('B').length - 1) * _aZwd;
      _zeroSpace += (_search.split('N').length - 1) * _aZwd;
      _zeroSpace += (_search.split('M').length - 1) * _aZwd;
      // 当前累计加上这一次的搜索项目宽度。
      _temporaryWidth +=
          (_search.length * 14.0) + 20.0 - _zeroSpace + _widgetLeft;
      _widgetWidth = (_search.length * 14.0) + 20.0 - _zeroSpace + _widgetLeft;
      // 这一次累计的搜索项目宽度大于当前的屏幕宽度。
      if (_temporaryWidth >= contextWidth) {
        // 将当前处理的行（`Row`）组件列表项添加到搜索项目（`Widget`）组件列表。
        searchRowList.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: _temporaryRowList,
          ),
        ));
        // 清理一下当前处理的行（`Row`）组件列表项'。
        _temporaryRowList = [];
        // 重置当前累计的搜索项目宽度。
        _temporaryWidth = 0.0;
        _widgetLeft = 0.0;
        // 重置后当前累计加上这一次的搜索项目宽度。
        _temporaryWidth +=
            (_search.length * 14.0) + 20.0 - _zeroSpace + _widgetLeft;
        // 如果当前组件的宽度太大了，就给一个固定的大小。
        if (_widgetWidth >= contextWidth) {
          _widgetWidth = contextWidth;
        }
      }
      // 在当前处理的行（`Row`）组件列表项里添加具体组件。
      _temporaryRowList.add(
        GestureDetector(
          child: Container(
            // 填充（`padding`）属性，在装饰里面的空白空间，如果有的话，将子组件放在这个衬垫内。
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.only(
              bottom: 10.0,
              left: _widgetLeft,
            ),
            width: _widgetWidth,
            height: 28.0,
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
      if (_temporaryRowList.length >= 1) {
        _widgetLeft = 9.0;
      } else {
        _widgetLeft = 0.0;
      }
    }
    // 最后当前处理的行（`Row`）组件列表项里还有剩余项目没有处理。
    if (_temporaryRowList.length != 0) {
      // 将剩余的当前处理的行（`Row`）组件列表项添加到搜索项目（`Widget`）组件列表。
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
