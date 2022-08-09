part of 'user_logout_cubit.dart';

abstract class UserLogoutState extends Equatable {
  const UserLogoutState();
}

class UserLogoutInitial extends UserLogoutState {
  @override
  List<Object?> get props => [];
}

class UserLogoutLoading extends UserLogoutState {
  @override
  List<Object?> get props => [];
}

class UserLogoutSucess extends UserLogoutState {
  @override
  List<Object?> get props => [];
}

class UserLogoutFailure extends UserLogoutState {
  final String message;

  const UserLogoutFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
