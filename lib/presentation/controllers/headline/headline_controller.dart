import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_clean_architecture/domain/entities/article.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';
import 'package:getx_clean_architecture/domain/usecases/fetch_headline_use_case.dart';
import 'package:tuple/tuple.dart';

class HeadlineController extends GetxController {
  HeadlineController(this._fetchHeadlineUseCase);
  final FetchHeadlineUseCase _fetchHeadlineUseCase;
  int _currentPage = 1;
  int _pageSize = 20;
  var _isLoadMore = false;
  var _paging = Rx<Paging?>(null);

  var articles = RxList<Article>([]);

  fetchData() async {
    final newPaging =
        await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.assignAll(newPaging.articles);
    _paging.value = newPaging;
  }

  loadMore() async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging =
        await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.addAll(newPaging.articles);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
