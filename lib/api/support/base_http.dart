import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseHttp {
  static const String _url = 'https://zxax.sjzajak.cn/prod-api';
  static String? _token;
  static Map<String, String> baseHeaders = {
    'accept': 'application/json, text/plain, */*',
    'accept-language': 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7',
    'authorization': _token == null ? '' : 'Bearer $_token',
    'content-type': 'application/json',
    'sec-ch-ua':
        '"Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Windows"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-origin'
  };
  static refreshHeaders() {
    baseHeaders = {
      'accept': 'application/json, text/plain, */*',
      'accept-language': 'zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7',
      'authorization': _token == null ? '' : 'Bearer $_token',
      'content-type': 'application/json',
      'sec-ch-ua':
          '"Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-origin'
    };
  }

  static set token(String? token) {
    BaseHttp._token = token;
    refreshHeaders();
  }

  static String? get token => _token;

  static Future<http.Response> get(String path) {
    return http.get(Uri.parse('$_url$path'), headers: baseHeaders);
  }

  static Future<http.Response> post(String path, {Object? body}) {
    return http.post(Uri.parse('$_url$path'),
        headers: baseHeaders,
        body: body,
        encoding: Encoding.getByName('utf-8'));
  }
}
