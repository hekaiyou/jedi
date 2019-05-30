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
    print('网络请求——获取分类信息：');
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
    print('网络请求——获取页面布局：');
    print(e);
  }
}

/// 获取商品组。(弃用)
/// POST /api/get_goodsgroups/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "goodsgroups": [
///     {
///       "groupname": "热销榜单",
///       "outGoodsDetailList": [
///         {
///           "id": 1,
///           "title": "【正版包邮】蔡康永的情商课:为你自己活一次 2018蔡康永的说话之道后新书马东奇葩说推荐沟通交流的艺术把话说到人心情商提升书籍",
///           "picturl": "https://img.alicdn.com/tfscom/i2/2609694927/O1CN01WxQr5Y1mGbw41niLs_!!0-item_pic.jpg",
///           "volume": 783,
///           "reserveprice": 42, 「商品原价」
///           "zkfinalprice": 20.4, 「券后价」
///           "isselfupport": "2", 「是否自平台商品」
///           "couponShareUrl": "//uland.taobao.com/coupon/edetail?e=Rrw...", 「二合一页面链接」
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
    print('网络请求——获取商品组：');
    print(e);
  }
}

/// 通用搜索优惠劵。
/// POST /api/taobao_material_optional/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "materialoptional": [
///     {
///       "typeid": 0,
///       "materialgroupname": "热销榜单",
///       "outMaterialDetailList": [
///         {
///           "shortTitle": "欧美街头ins女装字母印花短袖t恤", 「商品短标题」
///           "pictUrl": "https://img.alicQr5Y1mGbw41niLs_!!0-item_pic.jpg", 「商品主图」
///           "couponTotalCount": 10000, 「优惠券总量」
///           "couponRemainCount": 9181, 「优惠券剩余量」
///           "zkFinalPrice": 42, 「商品原价」
///           "couponAmount": 20.4, 「优惠券面额」
///           "isselfupport": "2", 「是否自平台商品」
///           "title": "欧美街头ins女装WORK HARD AND BE NICE字母印花短袖T恤 夏季新款", 「商品标题」
///           "userType": 0, 「卖家类型」
///           "smallImages": [ 「商品图片」
///             "https://img.alicdn.com/i4/1098689030/TB2bK_KFTJYBeNjy1zeXXahzVXa_!!1098689030.jpg",
///             ...
///           ]
///         {
///       ],
///     },
///     ...
///   ],
/// }
Future apiTaobaoMaterialOptional({
  int typeid,
  String q,
  int pagesize,
  int pageno,
  String sort,
}) async {
  try {
    Map responseData = {'typeid': typeid, 'q': q};
    if (pagesize != null) {
      responseData['pagesize'] = pagesize;
    }
    if (pageno != null) {
      responseData['pageno'] = pageno;
    }
    if (sort != null) {
      responseData['sort'] = sort;
    }
    Response response = await dio
        .post('/taobao_material_optional/', data: responseData);
    imageurlHeadGoodsgroups = response.data['data']['imageurlhead'];
    return response.data['data']['materialoptional'];
  } catch (e) {
    print('网络请求——通用搜索优惠劵：');
    print(e);
  }
}
