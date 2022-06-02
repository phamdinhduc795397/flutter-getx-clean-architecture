import 'package:get/get.dart';
import 'package:getx_clean_architecture/data/repositories/auth_repository.dart';
import 'package:getx_clean_architecture/data/repositories/article_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => AuthenticationRepositoryIml());
    Get.lazyPut(() => ArticleRepositoryIml());
  }
}
