import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/scrolling_link.dart';

/// 自定义的精选头条新闻组件。
class FeaturedHeadlines extends StatelessWidget {
  /// 放到滚动区域的新闻及其操作列表，格式为[[String, String],...]。
  final List<List<String>> headlines;

  FeaturedHeadlines({
    this.headlines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      padding: EdgeInsets.symmetric(
        horizontal: 13.0,
      ),
      height: 49.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/featured_headlines_title.png'),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 7.0,
            ),
            height: 14.0,
            width: 2.0,
            color: Color(0xffE2E2E2),
          ),
          Expanded(
            child: ScrollingLink(
              seconds: 5,
              headlines: headlines,
            ),
          ),
        ],
      ),
    );
  }
}
