import 'package:http/http.dart';
import './support/base_http.dart';

Future<Response> treeSelect() async {
  return await BaseHttp.get('/course/course_type/treeselect');
}
