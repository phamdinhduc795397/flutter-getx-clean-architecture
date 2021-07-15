import 'package:getx_clean_architecture/core/usecases/pram_usecase.dart';
import 'package:getx_clean_architecture/domain/entities/repo.dart';
import 'package:getx_clean_architecture/domain/repositories/search_repository.dart';

class SearchRepoUseCase extends ParamUseCase<List<Repo>, String> {
  final SearchRepository repo;

  SearchRepoUseCase({required this.repo});

  @override
  Future<List<Repo>> execute(String keyword) {
    return repo.searchRepo(keyword);
  }
}
