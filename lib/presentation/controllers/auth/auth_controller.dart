import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/services/local_storage.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:getx_clean_architecture/domain/usecases/signup_use_case.dart';

class AuthController extends GetxController {
  AuthController(this._loginUseCase);
  final SignUpUseCase _loginUseCase;
  final store = Get.find<LocalStorageService>();
  var isLoggedIn = false.obs;

  User? get user => store.user;

  @override
  void onInit() async {
    super.onInit();
    isLoggedIn.value = store.user != null;
  }

  signUpWith(String username) async {
    try {
      final user = await _loginUseCase.execute(username);
      store.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
    } catch (error) {}
  }

  logout() {
    store.user = null;
    isLoggedIn.value = false;
  }
}
