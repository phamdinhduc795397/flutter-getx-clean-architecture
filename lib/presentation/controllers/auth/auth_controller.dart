import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/usecases/login_use_case.dart';
import 'package:tuple/tuple.dart';

class AuthController extends GetxController {
  AuthController(this._loginUseCase);
  final LoginUseCase _loginUseCase;

  var isLoggedIn = false.obs;

  logIn() async {
    final isLoginSuccess =
        await _loginUseCase.execute(Tuple2('demo@gmail.com', "123456"));
    isLoggedIn.value = isLoginSuccess;
  }

  logout() {
    isLoggedIn.value = false;
  }
}
