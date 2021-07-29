import 'package:getx_clean_architecture/domain/entities/paging.dart';

abstract class ArticleRepository {
  Future<Paging> fetchHeadline(int page, int pageSize);
  Future<Paging> fetchNewsByCategory(String keyword, int page, int pageSize);
}
