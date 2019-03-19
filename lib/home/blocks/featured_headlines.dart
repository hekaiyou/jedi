import 'package:flutter/material.dart';

class FeaturedHeadlines extends StatefulWidget {
  @override
  _FeaturedHeadlinesState createState() => _FeaturedHeadlinesState();
}

class _FeaturedHeadlinesState extends State<FeaturedHeadlines> {
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
        ],
      ),
    );
  }
}
