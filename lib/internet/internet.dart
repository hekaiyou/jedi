import 'package:dio/dio.dart';

// 使用默认配置并自定义部分参数。
Dio dio = Dio()
  ..options.baseUrl = 'https://www.yujianshenghuo.com/api'
  // ..options.baseUrl = 'http://192.168.31.106:6666/api'
  ..options.connectTimeout = 5000
  ..options.receiveTimeout = 3000
  ..options.headers = {
    'Content-Type': 'application/json',
  };
