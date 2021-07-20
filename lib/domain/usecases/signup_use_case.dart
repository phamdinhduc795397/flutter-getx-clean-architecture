import 'package:getx_clean_architecture/app/core/usecases/pram_usecase.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';
import 'package:getx_clean_architecture/domain/repositories/auth_repository.dart';

class SignUpUseCase extends ParamUseCase<User, String> {
  final AuthenticationRepository _repo;
  SignUpUseCase(this._repo);

  @override
  Future<User> execute(String username) {
    return _repo.signUp(username);
  }
}
