import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

/// 分类信息的网络图片地址前缀。
String imageurlHeadGoodscategory;
String imageurlHeadPagelayout;

/// 获取分类信息。
/// POST /api/get_goodscategory/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "goodscategory": [
///     {
///       "categoryname": "母婴",
///       "categoryimage": "category.jpg",
///       "childsOutGoodsCategory": [
///         {
///           "categoryname": "婴童服饰",
///           "categoryimage": "category.jpg",
///         },
///         ...
///       ],
///     },
///     ...
///   ],
/// }
Future apiGetGoodscategory() async {
  try {
    Response response = await dio.post('/get_goodscategory/');
    imageurlHeadGoodscategory = response.data['data']['imageurlhead'];
    return response.data['data']['goodscategory'];
  } catch (e) {
    print(e);
  }
}

/// 获取页面布局。
/// POST /api/get_pagelayout/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "pagelayout": [
///     {
///       "text": "广告",
///       "layoutimage": "category.jpg",
///       "type": "1",
///       "clickurl": "www.baidu.com",
///       "taobaoclassifyid": "123456",
///     },
///     ...
///   ],
/// }
Future apiGetGetPagelayout({int categoryid}) async {
  try {
    Response response =
        await dio.post('/get_pagelayout/', data: {'categoryid': categoryid});
    imageurlHeadPagelayout = response.data['data']['imageurlhead'];
    return response.data['data']['pagelayout'];
  } catch (e) {
    print(e);
  }
}
