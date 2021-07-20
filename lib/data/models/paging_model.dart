import 'package:getx_clean_architecture/data/models/article_model.dart';
import 'package:getx_clean_architecture/domain/entities/paging.dart';

class PagingModel extends Paging {
  PagingModel({
    required this.totalResults,
    required this.articles,
  }) : super(articles: articles, totalResults: totalResults);

  final int totalResults;
  final List<ArticleModel> articles;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: json["totalResults"],
        articles:
            List.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}
