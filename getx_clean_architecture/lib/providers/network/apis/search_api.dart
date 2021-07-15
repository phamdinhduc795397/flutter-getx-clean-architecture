import 'dart:io';

import 'package:getx_clean_architecture/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/providers/network/api_request_representable.dart';

enum SearchType { repos, users }

class SearchAPI implements APIRequestRepresentable {
  final SearchType type;
  final String q;

  const SearchAPI._({required this.type, required this.q});

  const SearchAPI.repos(String q) : this._(type: SearchType.repos, q: q);
  const SearchAPI.users(String q) : this._(type: SearchType.users, q: q);

  @override
  String get endpoint => APIEndpoint.github;

  String get path {
    switch (type) {
      case SearchType.repos:
        return "/search/repositories?q=$q";
      case SearchType.users:
        return "/search/users?q=$q";
      default:
        return "";
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
