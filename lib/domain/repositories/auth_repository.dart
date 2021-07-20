import 'package:getx_clean_architecture/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> signUp(String username);
}
