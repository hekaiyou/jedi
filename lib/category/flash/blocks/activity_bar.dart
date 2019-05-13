import 'package:flutter/material.dart';
import 'package:jedi/category/flash/blocks/extension_carousel_slider.dart';

/// 自定义的活动栏组件。
class ActivityBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 在堆栈（`Container`）组件的最底层放一个白版。
        Container(
          height: 156.0,
          color: Color(0xffFFFFFF),
        ),
        DecoratedBox(
          // 装饰（`decoration`）属性，具体怎么画装饰。
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/flash_bar_plate_2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            height: 117.0,
          ),
        ),
        Align(
          // 对准属性，如何调整子组件。
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 156.0,
            width: double.infinity,
            padding: EdgeInsets.only(top: 10.0),
            child: CarouselExtensionSlider(
              imgList: [
                [
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552850106279&di=66945cb570b8b229ef2cd44439f29191&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170916%2Fa941249e25e8495e81ff845b53a0a631.gif',
                  ''
                ],
                [
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552849040492&di=466f5b51f52223e7855a60c522f9caed&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F05%2F51%2F77%2F175ae675f513899.jpg',
                  ''
                ],
                [
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552848913675&di=27dcd7c44c7f26207b62f77cb1bd3c0d&imgtype=0&src=http%3A%2F%2Fpic.90sjimg.com%2Fdesign%2F00%2F66%2F06%2F05%2Fe348ca963a431520d0b6898dffd47fe4.jpg',
                  ''
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
