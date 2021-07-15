import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_clean_architecture/data/repositories/search_repository.dart';
import 'package:getx_clean_architecture/domain/usecases/search_user_use_case.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_user/search_user_controller.dart';

class SearchUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUserUseCase(repo: Get.find<SearchRepositoryIml>()));
    Get.lazyPut(
      () => SearchUserController(
        Get.find(),
      ),
    );
  }
}
