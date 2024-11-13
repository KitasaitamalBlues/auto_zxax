import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_zaxxer/api/support/base_http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Uint8List? captchaImage;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        TextButton(
          onPressed: () async {
            var res = await BaseHttp.get('/captchaImage');
            res.body;
            var jsonRes = jsonDecode(res.body);
            captchaImage = base64Decode(jsonRes['img']);
            setState(() {});
          },
          child: const Text('点击获取验证码'),
        ),
        captchaImage != null ? Image.memory(captchaImage!) : Container()
      ]),
    );
  }
}
