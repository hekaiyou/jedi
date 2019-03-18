import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/activity_bar.dart';

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
      ],
    );
  }
}
