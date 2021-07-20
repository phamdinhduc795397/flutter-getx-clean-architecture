import 'dart:io';

import 'package:getx_clean_architecture/data/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/data/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';

enum ArticleType { fetchHeadline, fetchNews }

class ArticleAPI implements APIRequestRepresentable {
  final ArticleType type;
  String? keyword;
  int? page;
  int? pageSize;

  ArticleAPI._({required this.type, this.keyword, this.page, this.pageSize});

  ArticleAPI.fetchHeadline(int page, int pageSize)
      : this._(type: ArticleType.fetchHeadline, page: page, pageSize: pageSize);
  ArticleAPI.fetchNews(String keyword, int page, int pageSize)
      : this._(
            type: ArticleType.fetchNews,
            keyword: keyword,
            page: page,
            pageSize: pageSize);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
    switch (type) {
      case ArticleType.fetchHeadline:
        return "/top-headlines";
      case ArticleType.fetchNews:
        return "/top-headlines";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  Map<String, String> get headers =>
      {"X-Api-Key": "d809d6a547734a67af23365ce5bc8c02"};

  Map<String, String> get query {
    switch (type) {
      case ArticleType.fetchHeadline:
        return {"country": "us", "page": "$page", "pageSize": "$pageSize"};
      case ArticleType.fetchNews:
        return {"page": "$page", "pageSize": "$pageSize", "q": keyword ?? ""};
    }
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
