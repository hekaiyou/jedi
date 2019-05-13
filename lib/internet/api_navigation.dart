import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

String imageurlHeadGoodscategory;
String imageurlHeadPagelayout;
String imageurlHeadGoodsgroups;

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

/// 获取商品组。
/// POST /api/get_goodsgroups/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "goodsgroups": [
///     {
///       "groupname": "热销榜单",
///       "goodsDetailList": [
///         {
///           "id": 1,
///           "title": "【正版包邮】蔡康永的情商课:为你自己活一次 2018蔡康永的说话之道后新书马东奇葩说推荐沟通交流的艺术把话说到人心情商提升书籍",
///           "picturl": "https://img.alicdn.com/tfscom/i2/2609694927/O1CN01WxQr5Y1mGbw41niLs_!!0-item_pic.jpg",
///           "volume": 783,
///           "reserveprice": 42,
///           "zkfinalprice": 20.4,
///           "isselfupport": "2",
///         {
///       ],
///     },
///     ...
///   ],
/// }
Future apiGetGoodsgroups({int typeid}) async {
  try {
    Response response =
        await dio.post('/get_goodsgroups/', data: {'typeid': typeid});
    imageurlHeadGoodsgroups = response.data['data']['imageurlhead'];
    return response.data['data']['goodsgroups'];
  } catch (e) {
    print(e);
  }
}
