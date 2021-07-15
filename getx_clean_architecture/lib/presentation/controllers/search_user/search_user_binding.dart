import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_user/search_user_controller.dart';
import 'package:getx_clean_architecture/domain/repositories/search_repository.dart';
import 'package:getx_clean_architecture/domain/usecases/search_repo_use_case.dart';

class SearchUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchUserController>(
      () => SearchUserController(
        searchUserUseCase: SearchUserUseCase(repo: SearchUserRepository()),
      ),
    );
  }
}
