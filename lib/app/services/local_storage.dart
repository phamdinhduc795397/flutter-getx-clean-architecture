import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;
  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  User? get user {
    final rawJson = _sharedPreferences?.getString(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }

  set user(User? value) {
    if (value != null) {
      _sharedPreferences?.setString(
          _Key.user.toString(), json.encode(value.toJson()));
    } else {
      _sharedPreferences?.remove(_Key.user.toString());
    }
  }
}
