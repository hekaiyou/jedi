import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

String imageurlHeadGetBbsdetail;

List<dynamic> bbscategoryList;

/// 获取社区分类。
/// POST /api/get_bbscategory/
/// {
///   "bbscategory": [
///     {
///       "id": 12, 「分类ID」
///       "isvalid": "1",
///       "ordersn": 1,
///       "level": 1,
///       "position": "tr_0",
///       "categoryname": "宣传素材", 「分类名称」
///       "parentid": 0,
///       "outBbsCategoryList": [
///         {
///           "id": 1201, 「分类ID」
///           "isvalid": "1",
///           "ordersn": 1,
///           "level": 2,
///           "position": "tr_0 tr_12",
///           "categoryname": "早安日签", 「分类名称」
///           "parentid": 12,
///           "outBbsCategoryList": [],
///         },
///         ...
///     }
///     ...
///   ],
/// }
Future apiGetBbscategory() async {
  try {
    Response response = await dio.post('/get_bbscategory/');
    bbscategoryList = response.data['data']['bbscategory'];
    return bbscategoryList;
  } catch (e) {
    print('网络请求——获取社区分类：');
    print(e);
  }
}

/// 获取社区内容。
/// POST /api/get_bbsdetail/
/// {
///   "imageurlhead": "http://39.105.23.168:9999",
///   "bbsdetail": [
///     {
///       "id": 1,
///       "categoryid": 1201,
///       "username": "Ji69l",
///       "avatar": "/attachment/images/2019/06/03/image_1519955.png",
///       "cda": "2019-05-21 21:45:21.0",
///       "detail": "好货",
///       "outBbsAttachList": [
///         {
///           "imagetype": "1",
///           "content": {
///             "categoryId":50013878,
///             "categoryName":"发饰",
///             "commissionRate":"900",
///             "couponAmount":"5",
///             "couponStartTime":"2019-05-18"
///             "couponEndTime":"2019-05-24",
///             "couponId":"7998a397bcc14a909edc0c29cd0c88f7",
///             "couponInfo":"满10.00元减5元",
///             "couponRemainCount":99000,
///             "couponShareUrl":"//uland.taobao.com/...",
///             "couponStartFee":"10.00",
///             "couponTotalCount":100000,
///             "itemId":573642589872,
///             ...
///           },
///           "image": "https://img.alicdn.com/bao/uploaded/i4/2...3.jpg"
///         }
///         ...
///       ]
///     }
///     ...
///   ],
/// }
Future apiGetBbsdetail({int categoryid}) async {
  try {
    Response response = await dio.post('/get_bbsdetail/', data: {
      'categoryid': categoryid,
    });
    imageurlHeadGetBbsdetail = response.data['data']['imageurlhead'];
    return response.data['data']['bbsdetail'];
  } catch (e) {
    print('网络请求——获取社区内容：');
    print(e);
  }
}
