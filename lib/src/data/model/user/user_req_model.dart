class UserReqModel {
  final String userEmail;
  final String userPassword;

  const UserReqModel({
    required this.userEmail,
    required this.userPassword,
  });
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = userEmail;
    data['password'] = userPassword;
    return data;
  }
}
