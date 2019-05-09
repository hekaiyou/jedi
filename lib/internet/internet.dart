import 'package:dio/dio.dart';

// 使用默认配置并自定义部分参数。
Dio dio = Dio()
  ..options.baseUrl = 'http://39.105.23.168:6666/api'
  ..options.connectTimeout = 5000
  ..options.receiveTimeout = 3000
  ..options.headers = {
    'Content-Type': 'application/json',
  };
