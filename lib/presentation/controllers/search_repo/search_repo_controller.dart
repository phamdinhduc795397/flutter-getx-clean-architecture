import 'package:get/get.dart';
import 'package:getx_clean_architecture/domain/entities/repo.dart';
import 'package:getx_clean_architecture/domain/usecases/search_repo_use_case.dart';
import 'package:getx_clean_architecture/presentation/pages/detail/detail_page.dart';

class SearchRepoController extends GetxController {
  SearchRepoController(this._searchRepoUseCase);
  final SearchRepoUseCase _searchRepoUseCase;

  var repos = <Repo>[].obs;
  var isLoading = false.obs;

  search(String q) async {
    isLoading.value = true;
    final res = await _searchRepoUseCase.execute(q);
    repos.clear();
    this.repos.addAll(res);
    isLoading.value = false;
  }
}

extension NavigateHandle on SearchRepoController {
  navigateDetai(Repo repo) {
    Get.to(
      () => DetailPage(
        repo: repo,
      ),
    );
  }
}
