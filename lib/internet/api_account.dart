import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

/// 上传淘宝授权信息。(弃用)
/// POST /api/taobao_publisherinfo_save/
Future apiTaobaoPublisherInfoSave({
  String avatarurl,
  String nick,
  String openid,
  String opensid,
  String topaccesstoken,
  String topauthcode,
}) async {
  try {
    Response response = await dio.post('/taobao_publisherinfo_save/', data: {
      'avatarurl': avatarurl,
      'nick': nick,
      'openid': openid,
      'opensid': opensid,
      'topaccesstoken': topaccesstoken,
      'topauthcode': topauthcode,
    });
    print(nick);
    print(response.data);
    return response.data;
  } catch (e) {
    print('网络请求——上传淘宝授权信息：');
    print(e);
  }
}
