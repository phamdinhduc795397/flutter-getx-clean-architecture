import 'dart:io';
import 'package:getx_clean_architecture/data/providers/network/api_endpoint.dart';
import 'package:getx_clean_architecture/data/providers/network/api_provider.dart';
import 'package:getx_clean_architecture/data/providers/network/api_request_representable.dart';

enum AuthType { login, logout }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? username;
  String? password;

  AuthAPI._({required this.type, this.password, this.username});

  AuthAPI.login(String username, String repo) : this._(type: AuthType.login);
  AuthAPI.register(String password, String username)
      : this._(type: AuthType.login, username: username, password: password);

  @override
  String get endpoint => APIEndpoint.newsapi;

  String get path {
    switch (type) {
      case AuthType.login:
        return "/$username/$username";
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
