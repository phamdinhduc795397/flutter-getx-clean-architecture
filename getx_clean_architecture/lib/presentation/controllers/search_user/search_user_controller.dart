import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:getx_clean_architecture/domain/usecases/search_repo_use_case.dart';
import 'package:getx_clean_architecture/presentation/pages/detail/detail_page.dart';

class SearchUserController extends GetxController {
  final SearchUserUseCase searchUserUseCase;

  SearchUserController({required this.searchUserUseCase});

  final users = <User>[].obs;
  var isLoading = false.obs;

  search(String q) async {
    isLoading.value = true;
    final res = await searchUserUseCase.execute(q);
    users.clear();
    users.addAll(res);
    isLoading.value = false;
  }
}

extension NavigateHandle on SearchUserController {
  navigateDetai(User user) {
    Get.to(
      () => DetailPage(
        user: user,
      ),
      preventDuplicates: false,
    );
  }
}
