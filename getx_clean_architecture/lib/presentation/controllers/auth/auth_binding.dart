import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/auth_repository.dart';
import 'package:getx_clean_architecture/domain/usecases/login_use_case.dart';
import 'package:getx_clean_architecture/presentation/controllers/auth/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => LoginUseCase(repo: Get.find<AuthenticationRepositoryIml>()));
    Get.put(AuthController(Get.find()), permanent: true);
  }
}
