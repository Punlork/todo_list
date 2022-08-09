import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/http_client.dart';
import '../../../data/model/user/user_req_model.dart';
import '../../../services/authentication_service.dart';
import '../../../services/user_service.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial()) {
    _dio = Dio();
    _httpService = HttpService(_dio);
    _service = UserService(_httpService);
    _authService = AuthenticationService();
  }
  late Dio _dio = Dio();
  late HttpService _httpService;
  late UserService _service;
  late AuthenticationService _authService;

  void loginUser({required UserReqModel user}) async {
    emit(UserLoginInitial());
    try {
      if (user.userEmail.isEmpty) {
        emit(const UserLoginValidationFailure(message: 'Email is required'));
      } else if (user.userPassword.isEmpty) {
        emit(const UserLoginValidationFailure(message: 'Password is required'));
      }
      final response = await _service.userlogin(user: user);
      // await _todoCubit.saveTodoToken(response);
      await _authService.saveToken(response);
      emit(UserLoginSucess());
    } catch (e) {
      emit(
        UserLoginFailure(message: e.toString()),
      );
    }
  }
}
