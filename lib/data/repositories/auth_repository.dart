import 'package:getx_clean_architecture/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<bool> signIn(String username, String password) async {
    //Fake login action
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
