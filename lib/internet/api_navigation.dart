import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

String imageurlHeadGoodscategory;
String imageurlHeadPagelayout;
String imageurlHeadGoodsgroups;

List<dynamic> goodscategoryList;

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
    Response response = await dio.post('/get_goodscategory/', data: {
      'parentid': 0,
    });
    imageurlHeadGoodscategory = response.data['data']['imageurlhead'];
    goodscategoryList = response.data['data']['goodscategory'];
    return goodscategoryList;
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

/// 通用搜索优惠劵。
/// POST /api/taobao_material_optional/
/// {
///   "imageurlhead": "http://39.105.23.168:8888/images/",
///   "materialoptional": [
///     {
///       "typeid": 0,
///       "materialgroupname": "热销榜单",
///       "outGetMaterialDetailList": [
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
    Response response =
        await dio.post('/taobao_material_optional/', data: responseData);
    imageurlHeadGoodsgroups = response.data['data']['imageurlhead'];
    return response.data['data']['materialoptional'];
  } catch (e) {
    print('网络请求——通用搜索优惠劵：');
    print(e);
  }
}
