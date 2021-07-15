import 'package:getx_clean_architecture/core/usecases/pram_usecase.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:getx_clean_architecture/domain/repositories/search_repository.dart';

class SearchUserUseCase extends ParamUseCase<List<User>, String> {
  final SearchRepository repo;

  SearchUserUseCase({required this.repo});

  @override
  Future<List<User>> execute(String keyword) {
    return repo.searchUser(keyword);
  }
}
