import 'package:dio/dio.dart';

/// 使用默认配置并自定义部分参数。
Dio dio = Dio()
  ..options.baseUrl = 'https://www.yujianshenghuo.com/api'
  ..options.connectTimeout = 5000
  ..options.receiveTimeout = 4000
  ..options.headers = {
    'Content-Type': 'application/json',
  };

/// 重新设置网络请求的服务器地址。
void setDioUrl(String url) {
  dio.options.baseUrl = url;
}
