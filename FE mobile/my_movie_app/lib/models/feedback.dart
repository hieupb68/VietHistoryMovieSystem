class Role {
  final int id;
  final String name;

  Role({required this.id, required this.name});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }
}

class User {
  final int id;
  final String username;
  final String? password;
  final String? email;
  // final Role role;

  User({
    required this.id,
    required this.username,
     this.password,
    this.email,
    // required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      // role: Role.fromJson(json['role']),
    );
  }
}

class FeedbackModel {
  final int vote;
  final String comment;
  final User user;
  final bool commentBan;

  FeedbackModel({
    required this.vote,
    required this.comment,
    required this.user,
    required this.commentBan,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      vote: json['vote'],
      comment: json['comment'],
      user: User.fromJson(json['user']),
      commentBan: json['commentBan'],
    );
  }
}
