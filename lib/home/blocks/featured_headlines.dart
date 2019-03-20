import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/scrolling_link.dart';

/// 自定义的精选头条新闻组件。
class FeaturedHeadlines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              headlines: [
                ['山泉灌溉，不打农药的丑橘没吃就OUT啦~', ''],
                ['专为呵护婴儿设计的绵柔巾，第三件0元！', ''],
                ['潮爆办公室的网红下午茶，7.9元起', ''],
                ['源自新疆大草原的牛奶片，宝宝都喜欢吃哦~', ''],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
