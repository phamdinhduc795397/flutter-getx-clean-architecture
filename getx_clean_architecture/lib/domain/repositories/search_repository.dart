import 'package:getx_clean_architecture/providers/network/apis/search_api.dart';
import 'package:getx_clean_architecture/providers/models/repo_model.dart';
import 'package:getx_clean_architecture/providers/models/user_model.dart';

abstract class SearchRepository {
  Future search(String q);
}

class SearchRepoRepository extends SearchRepository {
  @override
  Future<List<RepoModel>> search(String q) async {
    final response = await SearchAPI.repos(q).request();
    final repos =
        (response["items"] as List).map((i) => RepoModel.fromJson(i)).toList();
    return repos;
  }
}

class SearchUserRepository extends SearchRepository {
  @override
  Future<List<UserModel>> search(String q) async {
    final response = await SearchAPI.users(q).request();
    final users =
        (response["items"] as List).map((i) => UserModel.fromJson(i)).toList();
    return users;
  }
}
