import 'package:flutter/material.dart';

/// 自定义的排序操作组件。
class SortOperation extends StatefulWidget {
  final Function sortCallback;
  final Function stypeCallback;

  SortOperation({
    this.sortCallback,
    this.stypeCallback,
  });

  @override
  _SortOperationState createState() => _SortOperationState();
}

/// 与自定义的排序操作组件关联的状态子类。
class _SortOperationState extends State<SortOperation> {
  /// 排序设置。
  String sort = '';

  /// 组件风格。
  int stype = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      // 装饰（`decoration`）属性，具体怎么画装饰。
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border(
          // 边界边（`BorderSide`）类，盒子边框的一面。
          top: BorderSide(
            color: Color(0xffE2E2E2),
            width: 1.0,
          ),
          bottom: BorderSide(
            color: Color(0xffE2E2E2),
            width: 1.0,
          ),
        ),
      ),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (sort == '') {
                    sort = 'total_sales_asc';
                  } else if (sort == 'total_sales_asc') {
                    sort = 'total_sales_des';
                  } else if (sort == 'total_sales_des') {
                    sort = 'total_sales_asc';
                  } else {
                    sort = 'total_sales_asc';
                  }
                });
                widget.sortCallback(sort);
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    color: Color(0xffFFFFFF),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '销量',
                        style: TextStyle(
                          // 字体大小。
                          fontSize: 15.0,
                          // 字体系列。
                          fontFamily: 'PingFangRegular',
                          // 颜色。
                          color: sort == 'total_sales_asc' ||
                                  sort == 'total_sales_des'
                              ? Color(0xFFFE7C30)
                              : Color(0xFF999999),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 7.0),
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: sort == 'total_sales_asc'
                                  ? Color(0xFFFE7C30)
                                  : Color(0xFF999999),
                              size: 15.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: sort == 'total_sales_des'
                                  ? Color(0xFFFE7C30)
                                  : Color(0xFF999999),
                              size: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (sort == '') {
                    sort = 'price_des';
                  } else if (sort == 'price_des') {
                    sort = 'price_asc';
                  } else if (sort == 'price_asc') {
                    sort = 'price_des';
                  } else {
                    sort = 'price_des';
                  }
                });
                widget.sortCallback(sort);
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    color: Color(0xffFFFFFF),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '价格',
                        style: TextStyle(
                          // 字体大小。
                          fontSize: 15.0,
                          // 字体系列。
                          fontFamily: 'PingFangRegular',
                          // 颜色。
                          color: sort == 'price_asc' || sort == 'price_des'
                              ? Color(0xFFFE7C30)
                              : Color(0xFF999999),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 7.0),
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: sort == 'price_asc'
                                  ? Color(0xFFFE7C30)
                                  : Color(0xFF999999),
                              size: 15.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: sort == 'price_des'
                                  ? Color(0xFFFE7C30)
                                  : Color(0xFF999999),
                              size: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (stype == 0) {
                    stype = 1;
                  } else if (stype == 1) {
                    stype = 0;
                  }
                });
                widget.stypeCallback(stype);
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    color: Color(0xffFFFFFF),
                  ),
                  Icon(
                    Icons.dashboard,
                    size: 18.0,
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
