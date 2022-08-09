import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/authentication_service.dart';

part 'user_logout_state.dart';

class UserLogoutCubit extends Cubit<UserLogoutState> {
  UserLogoutCubit() : super(UserLogoutInitial()) {
    _authService = AuthenticationService();
  }

  late final AuthenticationService _authService;

  Future<void> logout() async {
    emit(UserLogoutInitial());
    try {
      await _authService.logout();
      emit(UserLogoutSucess());
    } catch (e) {
      emit(
        UserLogoutFailure(message: e.toString()),
      );
    }
  }
}
