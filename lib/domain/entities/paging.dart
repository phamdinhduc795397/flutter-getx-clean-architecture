import 'package:getx_clean_architecture/domain/entities/article.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.articles,
  });

  int totalResults;
  List<Article> articles;
}
