class TodoResModel {
  late final int? status;
  late final String message;
  late final List<TodoModel> data;

  TodoResModel({
    required this.status,
    required this.message,
    required this.data,
  });

  TodoResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => TodoModel.fromJson(e)).toList();
  }
}

class TodoModel {
  TodoModel();

  late final String title;
  late final String? description;
  late final bool status;
  late final String date;

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    description = json['description'] as String;
    status = json['is_completed'] as bool;
    date = json['created_at'] as String;
  }
}
