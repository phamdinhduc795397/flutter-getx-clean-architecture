import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_clean_architecture/data/repositories/search_repository.dart';
import 'package:getx_clean_architecture/domain/usecases/search_repo_use_case.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_repo/search_repo_controller.dart';

class SearchRepoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchRepoUseCase(repo: Get.find<SearchRepositoryIml>()));
    Get.lazyPut(
      () => SearchRepoController(Get.find()),
    );
  }
}
