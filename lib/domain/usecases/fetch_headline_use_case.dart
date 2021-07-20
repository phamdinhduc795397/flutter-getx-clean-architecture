import 'package:getx_clean_architecture/app/core/usecases/pram_usecase.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';
import 'package:getx_clean_architecture/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchHeadlineUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  final ArticleRepository _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple2 param) {
    return _repo.fetchHeadline(param.item1, param.item2);
  }
}
