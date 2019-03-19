import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/activity_bar.dart';
import 'package:jedi/home/blocks/featured_segment.dart';
import 'package:jedi/home/blocks/featured_headlines.dart';

/// 自定义的精选页面组件。
class FeaturedPage extends StatefulWidget {
  @override
  _FeaturedPageState createState() => _FeaturedPageState();
}

/// 与自定义的精选页面组件关联的状态子类。
class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ActivityBar(),
        FeaturedSegment(),
        Divider(
          height: 1.0,
          color: Color(0xffE2E2E2),
        ),
        FeaturedHeadlines(),
        Container(
          height: 10.0,
          color: Color(0xffE2E2E2),
        ),
      ],
    );
  }
}
