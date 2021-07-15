import 'package:getx_clean_architecture/core/usecases/usecase.dart';
import 'package:getx_clean_architecture/domain/entities/repo.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:getx_clean_architecture/domain/repositories/search_repository.dart';

class SearchRepoUseCase extends ParamUseCase<List<Repo>, String> {
  final SearchRepoRepository repo;

  SearchRepoUseCase({required this.repo});

  @override
  Future<List<Repo>> execute(String keyword) {
    return repo.search(keyword);
  }
}

class SearchUserUseCase extends ParamUseCase<List<User>, String> {
  final SearchUserRepository repo;

  SearchUserUseCase({required this.repo});

  @override
  Future<List<User>> execute(String keyword) {
    return repo.search(keyword);
  }
}
