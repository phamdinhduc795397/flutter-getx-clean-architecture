import 'package:getx_clean_architecture/data/models/repo_model.dart';
import 'package:getx_clean_architecture/data/models/user_model.dart';
import 'package:getx_clean_architecture/data/providers/network/apis/search_api.dart';
import 'package:getx_clean_architecture/domain/repositories/search_repository.dart';

class SearchRepositoryIml extends SearchRepository {
  @override
  Future<List<UserModel>> searchUser(String q) async {
    final response = await SearchAPI.users(q).request();
    final users =
        (response["items"] as List).map((i) => UserModel.fromJson(i)).toList();
    return users;
  }

  @override
  Future<List<RepoModel>> searchRepo(String q) async {
    final response = await SearchAPI.repos(q).request();
    final repos =
        (response["items"] as List).map((i) => RepoModel.fromJson(i)).toList();
    return repos;
  }
}
