import 'package:flutter/material.dart';
import 'package:jedi/home/blocks/activity_bar.dart';
import 'package:jedi/home/blocks/featured_segment.dart';
import 'package:jedi/home/blocks/featured_headlines.dart';
import 'package:jedi/home/blocks/large_poster.dart';
import 'package:jedi/home/blocks/hot_list.dart';

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
          color: Color(0xffF6F6F6),
        ),
        LargePoster(),
        Container(
          height: 10.0,
          color: Color(0xffF6F6F6),
        ),
        HotList(
          hotData: <HotItem>[
            HotItem(
              objUrl: 'https://img.alicdn.com/i2/2615650292/O1CN011E1m5zcGXrNqYCH_!!2615650292.png_300x300.jpg',
              title: '抽纸批发整箱30包雪亮家庭装婴儿卫生纸巾家用餐巾纸面巾纸实惠装',
              rebatePrice: 26.99,
              costPrice: 29.99,
              couponPrice: 3.0,
              purchaseNum: 119992,
            ),
            HotItem(
              objUrl: 'http://images.huasheng100.com/public/1548233739017146.jpg?x-oss-process=image/resize,m_fixed,h_300,w_300',
              title: '【小魔鲸】A类女童内裤三角裤',
              rebatePrice: 15.5,
              costPrice: 20.5,
              couponPrice: 5.0,
              purchaseNum: 33548,
            ),
            HotItem(
              objUrl: 'http://images.huasheng100.com/public/1547102978196265.jpg?x-oss-process=image/resize,m_fixed,h_300,w_300',
              title: '【Miss face】妆前乳美白防晒隔离霜',
              rebatePrice: 74.9,
              costPrice: 89.9,
              couponPrice: 15.0,
              purchaseNum: 62260,
            ),
            HotItem(
              objUrl: 'https://img.alicdn.com/i4/1097805039/TB2susMuBjTBKNjSZFwXXcG4XXa_!!1097805039.jpg_300x300.jpg',
              title: '网红零食芒果干',
              rebatePrice: 24.9,
              costPrice: 29.9,
              couponPrice: 5.0,
              purchaseNum: 53487,
            ),
            HotItem(
              objUrl: 'https://img.alicdn.com/bao/uploaded/i2/273162744/O1CN01jd6G541W8nJLZyhRD_!!0-item_pic.jpg_300x300.jpg',
              title: '彼丽空气隐形丝袜液体小泡沫喷雾女喷脖子遮瑕补水定妆买3送防晒',
              rebatePrice: 9.0,
              costPrice: 29.0,
              couponPrice: 20.0,
              purchaseNum: 27845,
            ),
          ],
        ),
        Container(
          height: 10.0,
          color: Color(0xffF6F6F6),
        ),
      ],
    );
  }
}
