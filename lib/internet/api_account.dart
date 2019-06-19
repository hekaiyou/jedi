import 'package:dio/dio.dart';
import 'package:jedi/internet/internet.dart';

/// 获取验证码。
/// POST /api/get_verifcode/
/// {
///   msg: ,
///   code: 1,
/// }
Future apiGetVerifcode({
  String mobile,
}) async {
  try {
    Response response = await dio.post('/get_verifcode/', data: {
      'mobile': mobile,
      'veriftype': 52,
    });
    return response.data;
  } catch (e) {
    print('网络请求——获取验证码：');
    print(e);
  }
}

/// 登陆。
/// POST /api/login/
/// {
///   "msg": "登录失败,用户不存在!",
///   "code": -1
/// }
Future apiLogin({
  String mobile,
  String verifcode,
}) async {
  try {
    Response response = await dio.post('/login/', data: {
      'mobile': mobile,
      'loginpwd': '123456',
      'verifcode': verifcode,
      'logintype': 49,
    });
    return response.data;
  } catch (e) {
    print('网络请求——登陆：');
    print(e);
  }
}
