import 'dart:convert';

import 'package:auto_zaxxer/api/support/base_http.dart';
import 'package:http/http.dart';

import '../../api/login_api.dart' as login;

class LoginController {
  Future<Response> getCaptchaImage() async {
    return await login.getCaptchaImage();
  }

  Future<int> loginClient(Map<String, String> form) async {
    form['system'] = '1';
    var res = await login.login(form);
    if (res.statusCode == 200) {
      BaseHttp.token = jsonDecode(res.body)['token'];
    }
    return res.statusCode;
  }
}
