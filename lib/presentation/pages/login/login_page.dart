import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("Login")),
          body: Center(
            child:
                TextButton(onPressed: controller.logIn, child: Text("Login")),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
