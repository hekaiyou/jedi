import 'package:flutter/material.dart';
import 'package:jedi/home/featured/blocks/buying_date.dart';

/// 自定义的大海报组件。
class LargePoster extends StatelessWidget {
  /// 海报图片的地址列表，需要按顺序来。
  final List<String> posterPicture;

  LargePoster({
    this.posterPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      height: 199.0,
      // 用行（`Row`）组件把第一块瓷砖与第二块、第三块、第四块瓷砖分开。
      child: Row(
        children: <Widget>[
          // 第一块瓷砖的内容，品牌闪购。
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                // 使用命名路由导航到第二个屏幕。
                Navigator.pushNamed(context, '/category/flash');
              },
              child: Container(
                // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
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
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text(
                        '品牌闪购',
                        style: TextStyle(
                          color: Color(0xff2B2F33),
                          fontFamily: 'PingFangMedium',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    // 放置“品牌闪购”的网络图片的容器（`Container`）组件。
                    Container(
                      padding: EdgeInsets.all(
                        13.0,
                      ),
                      height: 132.0,
                      child: Image.network(
                        posterPicture[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                left: 4.0,
              ),
              // 用列（`Column`）组件把第二块瓷砖与第三块、第四块瓷砖分开。
              child: Column(
                children: <Widget>[
                  // 第二块瓷砖的内容，限时抢购。
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        // 使用命名路由导航到第二个屏幕。
                        Navigator.pushNamed(context, '/category/limited');
                      },
                      child: Container(
                        // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
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
                        child: Row(
                          children: <Widget>[
                            Column(
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
                                BuyingDate(
                                  hour: 3,
                                  minute: 6,
                                  second: 12,
                                ),
                              ],
                            ),
                            Expanded(
                              // 放置“限时抢购”的网络图片的容器（`Container`）组件。
                              child: Container(
                                padding: EdgeInsets.all(
                                  7.0,
                                ),
                                height: 80.0,
                                child: Image.network(
                                  posterPicture[1],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 4.0,
                      ),
                      // 用行（`Row`）组件把第三块瓷砖与第四块瓷砖分开。
                      child: Row(
                        children: <Widget>[
                          // 第三块瓷砖的内容，爆款单。
                          Flexible(
                            flex: 1,
                            child: Container(
                              // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
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
                                  // 放置“爆款单”的网络图片的容器（`Container`）组件。
                                  Container(
                                    padding: EdgeInsets.all(
                                      5.0,
                                    ),
                                    height: 50.0,
                                    child: Image.network(
                                      posterPicture[2],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // 第四块瓷砖的内容，大额券榜。
                          Flexible(
                            flex: 1,
                            child: Container(
                              // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
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
                                left: 4.0,
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
                                  // 放置“大额券榜”的网络图片的容器（`Container`）组件。
                                  Container(
                                    padding: EdgeInsets.all(
                                      5.0,
                                    ),
                                    height: 50.0,
                                    child: Image.network(
                                      posterPicture[3],
                                      fit: BoxFit.contain,
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
