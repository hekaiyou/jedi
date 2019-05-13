import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

String imageurlHeadGoodsdetail;

/// 获取商品详情。
/// POST /api/get_goodsdetail/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "goodsdetail": [
///     id": 1,
///     "picturl": "https://img.alicdn.com/tfscom/i2/2609694927/O1CN01WxQr5Y1mGbw41niLs_!!0-item_pic.jpg",
///     "smallimageslist": "https://img.alicdn.com/tfscom/i1/2609694927/O1CN01YANjZG1mGbw2SGxwg_!!2609694927.jpg\",
///                     \"https://img.alicdn.com/tfscom/i3/2609694927/O1CN01aTCV8S1mGbv8hvblc_!!0-item_pic.jpg\",
///                     \"https://img.alicdn.com/tfscom/i3/2609694927/O1CN01DzgcWH1mGbuWV409l_!!2609694927.jpg\",
///                     \"https://img.alicdn.com/tfscom/i4/2609694927/O1CN01gitaur1mGbtVPOY9s_!!2609694927.jpg",
///     "isselfupport": "2"
///     "title": "111111",
///     "reserveprice": 42,
///     "zkfinalprice": 20.4,
///     "volume": 783,
///     "estimatedprice": 20.4,
///     "taobaousertype": 1,
///     "nick": "晋源图书专营店",
///   ],
/// }
Future apiGetGoodsdetail({int id}) async {
  try {
    Response response = await dio.post('/get_goodsdetail/', data: {'id': id});
    imageurlHeadGoodsdetail = response.data['data']['imageurlhead'];
    return response.data['data']['goodsdetail'];
  } catch (e) {
    print(e);
  }
}
