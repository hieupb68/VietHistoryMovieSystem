class Comment {
  final String name;
  final String cmt;
  final int? idMovie;

  Comment({
    required this.name,
    required this.cmt,
    this.idMovie,
  });

  // Convert từ JSON thành Comment object
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      name: json['name'] as String,
      cmt: json['cmt'] as String,
      idMovie: json['idMovie'] as int?,
    );
  }

  // Convert từ Comment object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cmt': cmt,
      'idMovie': idMovie,
    };
  }
}