class ProductReqModel {
  final String title;
  final String? description;
  final bool isCompleted;
  // late final DateTime date;
  // late final int userId;

  ProductReqModel({
    required this.title,
    required this.description,
    required this.isCompleted,
    // required this.date,
    // required this.userId,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['is_completed'] = isCompleted;
    // data['data'] = date;
    return data;
  }
}
