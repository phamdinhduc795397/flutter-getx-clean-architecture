import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_binding.dart';
import 'package:getx_clean_architecture/presentation/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      initialRoute: "/",
      initialBinding: AuthBinding(),
      home: HomePage(),
    );
  }
}
