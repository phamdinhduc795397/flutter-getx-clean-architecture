import 'dart:io';
import 'package:getx_clean_architecture/data/models/paging_model.dart';
import 'package:getx_clean_architecture/domain/repositories/article_repository.dart';
import 'dart:convert';

class MockArticleRepository extends ArticleRepository {
  @override
  Future<PagingModel> fetchHeadline(int page, int pageSize) async {
    final file = File('test/data/headline_sample.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data);
  }

  @override
  Future<PagingModel> fetchNewsByCategory(
      String keyword, int page, int pageSize) async {
    final file = File('test/data/news_sample.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data);
  }
}
