import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_binding.dart';
import 'package:getx_clean_architecture/presentation/root.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: AuthBinding(),
      home: Root(),
    );
  }
}
