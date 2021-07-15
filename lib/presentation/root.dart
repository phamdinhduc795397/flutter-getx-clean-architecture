import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';
import 'package:getx_clean_architecture/presentation/pages/home/home_page.dart';
import 'package:getx_clean_architecture/presentation/pages/login/login_page.dart';

class Root extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (_) {
        if (controller.isLoggedIn.value) {
          return HomePage();
        }
        return LoginPage();
      },
    );
  }
}
