import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/authentication_service.dart';

part 'check_token_state.dart';

class CheckTokenCubit extends Cubit<CheckTokenState> {
  CheckTokenCubit() : super(CheckTokenInitial()) {
    _service = AuthenticationService();
  }

  late AuthenticationService _service;

  Future<void> checkToken() async {
    emit(CheckTokenInitial());

    final token = await _service.checkToken();
    // final token1 = _service.checkToken1();

    if (token != null) {
      emit(CheckTokenAuthenticated());
    } else {
      emit(CheckTokenUnAuthenticated());
    }

    // if (token1 != null) {
    //   emit(CheckTokenAuthenticated());
    // } else {
    //   emit(CheckTokenUnAuthenticated());
    // }
  }
}
