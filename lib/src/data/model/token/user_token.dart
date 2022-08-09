class UserToken {
  late final String accessToken;
  late final String refreshToken;

  UserToken({
    required this.accessToken,
    required this.refreshToken,
  });

  UserToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}
