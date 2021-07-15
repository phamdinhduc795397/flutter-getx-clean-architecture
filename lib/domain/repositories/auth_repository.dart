abstract class AuthenticationRepository {
  Future<bool> signIn(String username, String password);
}
