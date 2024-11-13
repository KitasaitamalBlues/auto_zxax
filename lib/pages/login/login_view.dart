import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_zaxxer/route/router_table.dart';
import 'package:flutter/material.dart';

import './login_controller.dart';

class LoginPage extends StatefulWidget {
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool _isObscure = true;
  Uint8List? captchaImage;
  String? uuid;
  LoginController controller = LoginController();

  TextEditingController accountController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller.getCaptchaImage().then((res) {
      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        captchaImage = base64Decode(jsonRes['img']);
        uuid = jsonRes['uuid'];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('账号：'),
                SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: accountController,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('密码：'),
                SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: passwdController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure; // 切换可见性
                            });
                          },
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('验证码：'),
                SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: captchaController,
                    )),
                SizedBox(
                    width: 100,
                    child: MaterialButton(
                        onPressed: () {
                          controller.getCaptchaImage().then((res) {
                            if (res.statusCode == 200) {
                              var jsonRes = jsonDecode(res.body);
                              captchaImage = base64Decode(jsonRes['img']);
                              uuid = jsonRes['uuid'];
                            }
                            setState(() {});
                          });
                        },
                        child: captchaImage != null
                            ? Image.memory(captchaImage!)
                            : const Text('验证码加载失败'))),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                var res = await controller.loginClient({
                  'code': captchaController.text,
                  'password': passwdController.text,
                  'username': accountController.text,
                  'uuid': uuid ?? ''
                });
                if (res == 200) {
                  Navigator.of(context).popAndPushNamed(RouterTable.homePath);
                }
              },
              child: const Text('登录'),
            )
          ],
        ),
      )),
    );
  }
}
