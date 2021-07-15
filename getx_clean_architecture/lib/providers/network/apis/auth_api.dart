import 'dart:io';
import 'package:getx_clean_architecture/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/providers/network/api_request_representable.dart';

enum AuthType { login, logout }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  final String username;
  final String repo;

  const AuthAPI._(
      {required this.type, required this.username, required this.repo});

  const AuthAPI.login({required String username, required String repo})
      : this._(type: AuthType.login, username: username, repo: repo);

  @override
  String get endpoint => APIEndpoint.github;

  String get path {
    switch (type) {
      case AuthType.login:
        return "/$username/$repo";
      case AuthType.logout:
        return "/login";
      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  Map<String, String> get headers =>
      {HttpHeaders.contentTypeHeader: 'application/json'};

  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  get body => null;

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
