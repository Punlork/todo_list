import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/http_client.dart';
import '../../../data/model/user/user_req_model.dart';
import '../../../services/user_service.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());
  late Dio _dio = Dio();
  late HttpService _httpService;
  late UserService _service;

  void init() {
    _dio = Dio();
    _httpService = HttpService(_dio);
    _service = UserService(_httpService);
  }

  void registerUser({required UserReqModel user}) async {
    init();
    emit(CreateUserInitial());
    try {
      if (user.userEmail.isEmpty) {
        emit(const CreateUserValidationFailure(message: 'Email is required'));
      } else if (user.userPassword.isEmpty) {
        emit(
            const CreateUserValidationFailure(message: 'Password is required'));
      }
      await _service.userRegister(user: user);
      emit(CreateUserSucess());
    } catch (e) {
      emit(
        CreateUserFailure(message: e.toString()),
      );
    }
  }
}
