import 'package:flutter/material.dart';

/// 自定义的为你推荐标题组件。
class RecommendYouTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      height: 54.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 1.0,
            width: 66.0,
            color: Color(0xffFE823A),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 4.0,
            ),
            child: Image.asset('assets/recommend_you_title.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            child: Text(
              '为你推荐',
              style: TextStyle(
                color: Color(0xff333333),
                fontFamily: 'PingFangBold',
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            height: 1.0,
            width: 66.0,
            color: Color(0xffFE823A),
          ),
        ],
      ),
    );
  }
}
