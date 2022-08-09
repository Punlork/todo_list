import '../common/http_client.dart';
import '../data/model/token/user_token.dart';
import '../data/model/user/user_req_model.dart';
import '../data/model/user/user_res_model.dart';
import '../exceptions/bad_request_exception.dart';

class UserService {
  final HttpService _httpService;

  UserService(this._httpService);

  Future<UserResModel> getUser() async {
    final response = await _httpService.get('/users');
    try {
      if (response.statusCode == 201) {
        Map<String, dynamic> res = response.data;
        return UserResModel.fromJson(res);
      } else {
        throw RestBadRequestException(message: 'Error Unexpected');
      }
    } catch (e) {
      throw RestBadRequestException(
          message: response.statusMessage ?? 'Request Fail');
    }
  }

  Future<UserToken> userRegister({required UserReqModel user}) async {
    try {
      final response = await _httpService.post(
        '/auth/register',
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return UserToken.fromJson(response.data);
      } else {
        throw RestBadRequestException(message: 'Create Fail');
      }
    } catch (e) {
      throw RestBadRequestException(message: e.toString());
    }
  }

  Future<UserToken> userlogin({required UserReqModel user}) async {
    try {
      final response = await _httpService.post(
        '/auth/login',
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        final userToken = UserToken.fromJson(response.data);
        return userToken;
      } else {
        throw RestBadRequestException(message: 'Create Fail');
      }
    } catch (e) {
      throw RestBadRequestException(message: e.toString());
    }
  }
}
