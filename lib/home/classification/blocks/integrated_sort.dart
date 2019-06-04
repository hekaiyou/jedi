import 'package:flutter/material.dart';

/// 自定义的综合排序组件。
class IntegratedSort extends StatefulWidget {
  /// 页面的顶部高度。
  final double hight;

  /// 上一个页面传递的排序规则。
  final String sortOld;

  IntegratedSort({
    this.hight,
    this.sortOld,
  });

  @override
  _IntegratedSortState createState() => _IntegratedSortState();
}

/// 与自定义的综合排序组件关联的状态子类。
class _IntegratedSortState extends State<IntegratedSort> {
  /// 排序设置，默认不传，用服务器的默认排序。
  String sort = '';

  @override
  void initState() {
    sort = widget.sortOld;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Opacity(
            opacity: 0.0,
            child: Container(
              height: widget.hight,
              color: Colors.grey[900],
            ),
          ),
          onTap: () {
            // 点击提醒页面时并返回。
            Navigator.of(context).pop(null);
          },
        ),
        Container(
          width: double.infinity,
          color: Color(0xffFFFFFF),
          child: Material(
            color: Color(0xffFFFFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  // 选择综合排序的单击操作事件。
                  onTap: () {
                    setState(() {
                      sort = '';
                    });
                    Navigator.of(context).pop(sort);
                  },
                  child: Container(
                    // 装饰（`decoration`）属性，具体怎么画装饰。
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border(
                        // 边界边（`BorderSide`）类，盒子边框的一面。
                        top: BorderSide(
                          color: Color(0xffE2E2E2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '综合排序',
                          style: TextStyle(
                            // 字体大小。
                            fontSize: 14.0,
                            // 字体系列。
                            fontFamily: 'PingFangRegular',
                            // 颜色。
                            color: sort == ''
                                ? Color(0xFFFE7C30)
                                : Color(0xFF999999),
                          ),
                        ),
                        Icon(
                          Icons.done,
                          size: 18.0,
                          // 颜色。
                          color: sort == ''
                              ? Color(0xFFFE7C30)
                              : Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  // 选择优惠劵面值由高到低排序的单击操作事件。
                  onTap: () {
                    setState(() {
                      sort = 'tk_total_commi_des';
                    });
                    Navigator.of(context).pop(sort);
                  },
                  child: Container(
                    // 装饰（`decoration`）属性，具体怎么画装饰。
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border(
                        // 边界边（`BorderSide`）类，盒子边框的一面。
                        top: BorderSide(
                          color: Color(0xffE2E2E2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '优惠劵面值由高到低',
                          style: TextStyle(
                            // 字体大小。
                            fontSize: 14.0,
                            // 字体系列。
                            fontFamily: 'PingFangRegular',
                            // 颜色。
                            color: sort == 'tk_total_commi_des'
                                ? Color(0xFFFE7C30)
                                : Color(0xFF999999),
                          ),
                        ),
                        Icon(
                          Icons.done,
                          size: 18.0,
                          // 颜色。
                          color: sort == 'tk_total_commi_des'
                              ? Color(0xFFFE7C30)
                              : Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  // 选择优惠劵面值由低到高排序的单击操作事件。
                  onTap: () {
                    setState(() {
                      sort = 'tk_total_commi_asc';
                    });
                    Navigator.of(context).pop(sort);
                  },
                  child: Container(
                    // 装饰（`decoration`）属性，具体怎么画装饰。
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border(
                        // 边界边（`BorderSide`）类，盒子边框的一面。
                        top: BorderSide(
                          color: Color(0xffE2E2E2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '优惠劵面值由低到高',
                          style: TextStyle(
                            // 字体大小。
                            fontSize: 14.0,
                            // 字体系列。
                            fontFamily: 'PingFangRegular',
                            // 颜色。
                            color: sort == 'tk_total_commi_asc'
                                ? Color(0xFFFE7C30)
                                : Color(0xFF999999),
                          ),
                        ),
                        Icon(
                          Icons.done,
                          size: 18.0,
                          // 颜色。
                          color: sort == 'tk_total_commi_asc'
                              ? Color(0xFFFE7C30)
                              : Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  // 选择预估收益由高到低排序的单击操作事件。
                  onTap: () {
                    setState(() {
                      sort = 'tk_rate_des';
                    });
                    Navigator.of(context).pop(sort);
                  },
                  child: Container(
                    // 装饰（`decoration`）属性，具体怎么画装饰。
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      border: Border(
                        // 边界边（`BorderSide`）类，盒子边框的一面。
                        top: BorderSide(
                          color: Color(0xffE2E2E2),
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '预估收益由高到低',
                          style: TextStyle(
                            // 字体大小。
                            fontSize: 14.0,
                            // 字体系列。
                            fontFamily: 'PingFangRegular',
                            // 颜色。
                            color: sort == 'tk_rate_des'
                                ? Color(0xFFFE7C30)
                                : Color(0xFF999999),
                          ),
                        ),
                        Icon(
                          Icons.done,
                          size: 18.0,
                          // 颜色。
                          color: sort == 'tk_rate_des'
                              ? Color(0xFFFE7C30)
                              : Color(0xffFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Opacity(
              opacity: 0.2,
              child: Container(
                color: Colors.grey[900],
              ),
            ),
            onTap: () {
              // 点击提醒页面时并返回。
              Navigator.of(context).pop(null);
            },
          ),
        ),
      ],
    );
  }
}
