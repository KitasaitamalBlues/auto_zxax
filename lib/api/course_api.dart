// 'https://zxax.sjzajak.cn/prod-api/course/course_list_learning_info/complete/65242' get

import 'package:auto_zaxxer/api/support/base_http.dart';
import 'package:http/http.dart';

Future<Response> treeSelect() async {
  return await BaseHttp.get('/course/course_type/treeselect');
}
