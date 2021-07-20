class User {
  User({this.username});

  String? username;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      username: json?['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
