import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/util/dependency.dart';
import 'package:getx_clean_architecture/core/services/local_storage.dart';
import 'package:getx_clean_architecture/presentation/app.dart';

void main() async {
  DenpendencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(App());
}

initServices() async {
  print('starting services ...');
  await Get.putAsync(() => LocalStorageService().init());
  print('All services started...');
}
