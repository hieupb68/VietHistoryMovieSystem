class BasePageData<T> {
  final int totalPages;
  final int totalElements;
  final int size;
  final int numberOfElements;
  final List<T> content;
  final bool first;
  final bool last;

  BasePageData({
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.numberOfElements,
    required this.content,
    required this.first,
    required this.last,
  });

  factory BasePageData.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT, {
        bool isList = true, // Assuming content is usually a list.
      }) {
    // Safely handle content conversion
    final content = isList
        ? (json['content'] as List<dynamic>).map((item) {
      if (item is Map<String, dynamic>) {
        return fromJsonT(item);
      } else {
        throw Exception("Invalid item type: expected Map<String, dynamic>");
      }
    }).toList()
        : <T>[];

    return BasePageData<T>(
      totalPages: json['totalPages'] ?? 0,
      totalElements: json['totalElements'] ?? 0,
      size: json['size'] ?? 0,
      numberOfElements: json['numberOfElements'] ?? 0,
      content: content,
      first: json['first'] ?? false,
      last: json['last'] ?? false,
    );
  }
}
