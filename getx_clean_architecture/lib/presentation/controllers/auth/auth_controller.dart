import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/repositories/auth_repository.dart';

class AuthController extends GetxController {
  AuthController({required this.authRepo});
  final AuthenticationRepository authRepo;

  var isLoggedIn = false.obs;

  logIn() async {
    final isLoginSuccess = await authRepo.signIn();
    isLoggedIn.value = isLoginSuccess;
  }

  logout() {
    isLoggedIn.value = false;
  }
}
