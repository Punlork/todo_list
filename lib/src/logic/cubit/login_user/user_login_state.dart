part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();
}

class UserLoginInitial extends UserLoginState {
  @override
  List<Object?> get props => [];
}

class UserLoginLoading extends UserLoginState {
  @override
  List<Object?> get props => [];
}

class UserLoginSucess extends UserLoginState {
  @override
  List<Object?> get props => [];
}

class UserLoginFailure extends UserLoginState {
  final String message;

  const UserLoginFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class UserLoginValidationFailure extends UserLoginState {
  final String message;

  const UserLoginValidationFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
