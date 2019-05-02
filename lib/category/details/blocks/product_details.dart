import 'package:flutter/material.dart';

/// 自定义的商品详情组件。
class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

/// 与自定义的商品详情组件关联的状态子类。。
class _ProductDetailsState extends State<ProductDetails> {
  bool _currentPanel = false;

  /// 最终、字符串列表变量，商品详情图片列表。
  final List<String> imgList = [
    'http://img.alicdn.com/imgextra/i1/3634397379/TB2.obleyOYBuNjSsD4XXbSkFXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i2/3634397379/TB23ocsmL9TBuNjy1zbXXXpepXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i2/3634397379/TB2CaNZm9BYBeNjy0FeXXbnmFXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i4/3634397379/TB2_kwCdrwrBKNjSZPcXXXpapXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i1/3634397379/TB2gJz5mMaTBuNjSszfXXXgfpXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i1/3634397379/TB2SHBQm9tYBeNjSspkXXbU8VXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i2/3634397379/TB20ELUmQKWBuNjy1zjXXcOypXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i1/3634397379/TB2r5ZEdzQnBKNjSZSgXXXHGXXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i4/3634397379/TB2ajQcmHuWBuNjSszgXXb8jVXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i2/3634397379/TB2GVtIdScqBKNjSZFgXXX_kXXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i1/3634397379/TB2QQQCdrwrBKNjSZPcXXXpapXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i2/3634397379/TB2ptv.dsIrBKNjSZK9XXagoVXa_!!3634397379.jpg',
    'http://img.alicdn.com/imgextra/i4/3634397379/TB2DGeQeByWBuNkSmFPXXXguVXa_!!3634397379.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // 裂片列表（`SliverList`）组件，沿着主轴将多个盒子放置在线性阵列中的滚动条。
    return SliverList(
      // 委托（`delegate`）属性，为此组件提供子代的委托。
      // 裂片子代生成器委托（`SliverChildBuilderDelegate`）类，使用构建器回调提供子项的委托。
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // 单子代滚动视图（`SingleChildScrollView`）组件，可以滚动单个组件的框，这里用来处理阴影效果。
          return SingleChildScrollView(
            // 扩展面板列表（`ExpansionPanelList`）组件，一个扩展面板列表，其中列出了其子项并激活扩展。
            child: ExpansionPanelList(
              // 扩展回调（`expansionCallback`）属性，每当按下一个展开/折叠按钮时调用的回调。
              // 传递给回调的参数是列表中要展开的面板的索引（`int`）以及该面板当前是否已展开（`bool`）。
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  // 切换面板的展开/折叠状态。
                  _currentPanel = !_currentPanel;
                });
              },
              children: <ExpansionPanel>[
                // 扩展面板（`ExpansionPanel`）组件，有标题和正文，可以展开或折叠，正文仅在展开时可见。
                ExpansionPanel(
                  // 标题生成器（`headerBuilder`）属性，构建扩展面板标题的组件构建器。
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(
                        '查看宝贝详情',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontFamily: 'PingFangRegular',
                          fontSize: 15.0,
                        ),
                      ),
                    );
                  },
                  // 主体（`body`）属性，扩展面板的主体显示在标题下方。
                  body: ListBody(
                    children: imgList.map((String string) {
                      return Image.network(
                        string,
                        fit: BoxFit.fitWidth,
                      );
                    }).toList(),
                  ),
                  // 是否扩展（`isExpanded`）属性，面版是否扩展开来。
                  isExpanded: _currentPanel,
                  // 可以点按标题（`canTapOnHeader`）属性，标题面版是否可以点击。
                  canTapOnHeader: true,
                ),
              ],
            ),
          );
        },
        // 子代总数（`childCount`）属性，该委托可以提供的子代总数。
        childCount: 1,
      ),
    );
  }
}
