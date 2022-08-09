class UserResModel {
  late final int? status;
  late final String message;
  late final List<UserModel> data;

  UserResModel({
    required this.status,
    required this.message,
    required this.data,
  });

  UserResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['status']).map((e) => UserModel.fromJson(e)).toList();
  }
}

class UserModel {
  late final int userId;
  late final String userEmail;
  late final String userRole;
  late final int userCreatedDate;
  late final int userExpiredDate;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as int;
    userEmail = json['email'] as String;
    userRole = json['roles'] as String;
    userCreatedDate = json['iat'] as int;
    userExpiredDate = json['exp'] as int;
  }
}
