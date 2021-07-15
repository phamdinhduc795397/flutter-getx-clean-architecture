import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/core/util/dependency.dart';
import 'package:getx_clean_architecture/presentation/app.dart';

void main() {
  DenpendencyCreator.init();
  runApp(App());
}
