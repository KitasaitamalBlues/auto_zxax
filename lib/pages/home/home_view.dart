import 'dart:typed_data';

import 'package:auto_zaxxer/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Uint8List? captchaImage;
  HomeController controller = HomeController();
  late List courses;
  List<Widget> courseType = [];
  @override
  void initState() {
    super.initState();
    controller.treeSelect().then((res) {
      print('object');
      courses = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: []),
    );
  }
}
