import 'package:flutter/material.dart';
import 'package:jedi/home/classification/blocks/integrated_sort.dart';

/// 自定义的排序操作组件。
class SortOperation extends StatefulWidget {
  /// 综合排序页面的顶部高度。
  final double hight;

  /// 滚动控制器（`ScrollController`）类，控制可滚动的组件。
  final ScrollController controller;

  /// 排序规则变更回调。
  final Function sortCallback;

  /// 项目风格变更回调。
  final Function stypeCallback;

  SortOperation({
    this.hight,
    this.controller,
    this.sortCallback,
    this.stypeCallback,
  });

  @override
  _SortOperationState createState() => _SortOperationState();
}

/// 与自定义的排序操作组件关联的状态子类。
class _SortOperationState extends State<SortOperation> {
  /// 排序设置，默认不传，用服务器的默认排序。
  String sort = '';

  /// 组件风格，0表示1行1个，1表示1行2个。
  int stype = 0;

  bool isWithMore = false;

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
              // 综合排序的按钮点击事件。
              onTap: () {
                if (sort != '' &&
                    sort != 'tk_total_commi_des' &&
                    sort != 'tk_total_commi_asc' &&
                    sort != 'tk_rate_des') {
                  sort = '';
                }
                setState(() {
                  // 调整到顶部。
                  widget.controller.jumpTo(widget.hight - 32.0);
                  isWithMore = true;
                });
                // 导航器（`Navigator`）组件，用于管理具有堆栈规则的一组子组件。
                // 许多应用程序在其窗口组件层次结构的顶部附近有一个导航器，以便使用叠加显示其逻辑历史记录，
                // 最近访问过的页面可视化地显示在旧页面之上。使用此模式，
                // 导航器可以通过在叠加层中移动组件来直观地从一个页面转换到另一个页面。
                // 类似地，导航器可用于通过将对话框窗口组件放置在当前页面上方来显示对话框。
                // 导航器（`Navigator`）组件的关于（`of`）方法，来自此类的最近实例的状态，它包含给定的上下文。
                // 导航器（`Navigator`）组件的推（`push`）方法，将给定路径推送到最紧密包围给定上下文的导航器。
                Navigator.of(context)
                    .push(
                  // 页面路由生成器（`PageRouteBuilder`）组件，用于根据回调定义一次性页面路由的实用程序类。
                  PageRouteBuilder(
                    // 转换完成后路由是否会遮盖以前的路由。
                    opaque: false,
                    // 页面构建器（`pageBuilder`）属性，用于构建路径的主要内容。
                    pageBuilder: (BuildContext context, _, __) {
                      return IntegratedSort(
                        sortOld: sort,
                      );
                    },
                  ),
                )
                    .then((value) {
                  // 如果自定义的综合排序组件返回不为空时，更新
                  if (value != null) {
                    setState(() {
                      sort = value;
                      isWithMore = false;
                    });
                    widget.sortCallback(sort);
                  } else {
                    if (sort != 'tk_total_commi_des' &&
                        sort != 'tk_total_commi_asc' &&
                        sort != 'tk_rate_des') {
                      sort = '';
                    }
                    setState(() {
                      isWithMore = false;
                    });
                    widget.sortCallback(sort);
                  }
                });
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
                        '综合',
                        style: TextStyle(
                          // 字体大小。
                          fontSize: 15.0,
                          // 字体系列。
                          fontFamily: 'PingFangRegular',
                          // 颜色。
                          color: isWithMore
                              ? Color(0xFFFE7C30)
                              : Color(0xFF999999),
                        ),
                      ),
                      Icon(
                        isWithMore
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color:
                            isWithMore ? Color(0xFFFE7C30) : Color(0xFF999999),
                        size: 20.0,
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
              // 选择销量排序规则的按钮点击事件。
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
              // 选择价格排序规则的按钮点击事件。
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
                        '劵后价',
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
              // 切换列表风格的按钮点击事件。
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
                    stype == 0 ? Icons.dashboard : Icons.view_day,
                    size: 18.0,
                    color: Color(0xff999999),
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
