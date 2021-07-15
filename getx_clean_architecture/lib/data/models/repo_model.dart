import 'dart:convert';

import 'package:getx_clean_architecture/domain/entities/repo.dart';

RepoModel repoModelFromJson(String str) => RepoModel.fromJson(json.decode(str));

String repoModelToJson(RepoModel data) => json.encode(data.toJson());

class PagingModel<T> {
  PagingModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<T> items;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<T>.from(json["items"].map((x) => RepoModel.fromJson(x))),
      );
}

class RepoModel extends Repo {
  RepoModel({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? watchersCount,
    String? language,
  }) : super(
          id: id,
          nodeId: nodeId,
          name: name,
          fullName: fullName,
          avatarUrl: avatarUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
          watchersCount: watchersCount,
          language: language,
        );

  factory RepoModel.fromJson(Map<String, dynamic> json) => RepoModel(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        avatarUrl: json["avatar_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        watchersCount: json["watchers_count"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "avatar_url": avatarUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "watchers_count": watchersCount,
        "language": language,
      };
}
