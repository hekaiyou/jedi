import 'package:flutter/material.dart';

/// 自定义的大海报组件。
class LargePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      height: 199.0,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/home_porcelain_backplane_1.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              margin: EdgeInsets.only(
                right: 4.0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 14.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      '品牌闪购',
                      style: TextStyle(
                        color: Color(0xff2B2F33),
                        fontFamily: 'PingFangMedium',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 21.0,
                    width: 96.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/home_porcelain_backplane_5.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '洁婷第二件0元',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: 'PingFangRegular',
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                left: 4.0,
              ),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/home_porcelain_backplane_2.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        bottom: 4.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 10.0,
                              left: 14.0,
                            ),
                            child: Text(
                              '限时抢购',
                              style: TextStyle(
                                color: Color(0xff2B2F33),
                                fontFamily: 'PingFangMedium',
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 4.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/home_porcelain_backplane_3.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                right: 4.0,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 11.0,
                                    ),
                                    child: Text(
                                      '爆款单',
                                      style: TextStyle(
                                        color: Color(0xff2B2F33),
                                        fontFamily: 'PingFangMedium',
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/home_porcelain_backplane_4.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                right: 4.0,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 11.0,
                                    ),
                                    child: Text(
                                      '大额券榜',
                                      style: TextStyle(
                                        color: Color(0xff2B2F33),
                                        fontFamily: 'PingFangMedium',
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
