import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';
import 'package:getx_clean_architecture/domain/repositories/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
        AuthController(authRepo: AuthenticationRepositoryIml()),
        permanent: true);
  }
}
