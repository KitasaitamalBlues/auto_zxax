import 'dart:convert';

import 'package:auto_zaxxer/api/support/base_http.dart';
import 'package:http/http.dart';

Future<Response> getCaptchaImage() async {
  return await BaseHttp.get('/captchaImage');
}

Future<Response> login(Map<String, String> body) async {
  return await BaseHttp.post('/loginClient', body: jsonEncode(body));
}
