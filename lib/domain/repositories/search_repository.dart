import 'package:getx_clean_architecture/domain/entities/repo.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';

abstract class SearchRepository {
  Future<List<Repo>> searchRepo(String q);
  Future<List<User>> searchUser(String q);
}
