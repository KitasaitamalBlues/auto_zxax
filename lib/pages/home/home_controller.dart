import 'dart:convert';

import 'package:auto_zaxxer/api/course_api.dart' as api;

class HomeController {
  treeSelect() async {
    var res = await api.treeSelect();
    if (res.statusCode == 200) {
      return jsonDecode(res.body)['data'];
    }
  }
}
