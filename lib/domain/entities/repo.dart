class Repo {
  Repo({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
    this.watchersCount,
    this.language,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  String? avatarUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? watchersCount;
  String? language;
}
