import 'package:getx_clean_architecture/core/usecases/pram_usecase.dart';
import 'package:getx_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:tuple/tuple.dart';

class LoginUseCase extends ParamUseCase<bool, Tuple2<String, String>> {
  final AuthenticationRepository repo;
  LoginUseCase({required this.repo});

  @override
  Future<bool> execute(Tuple2<String, String> param) {
    return repo.signIn(param.item1, param.item2);
  }
}
