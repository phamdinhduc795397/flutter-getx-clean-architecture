import 'dart:io';

import 'package:getx_clean_architecture/data/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/data/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';

enum SearchType { repo, user }

class SearchAPI implements APIRequestRepresentable {
  final SearchType type;
  final String q;

  SearchAPI._({required this.type, required this.q});

  SearchAPI.repos(String q) : this._(type: SearchType.repo, q: q);
  SearchAPI.users(String q) : this._(type: SearchType.user, q: q);

  @override
  String get endpoint => APIEndpoint.github;

  String get path {
    switch (type) {
      case SearchType.repo:
        return "/search/repositories?q=$q";
      case SearchType.user:
        return "/search/users?q=$q";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  get body => null;

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Map<String, String>? get query => null;
}
