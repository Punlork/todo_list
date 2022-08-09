part of 'create_user_cubit.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();
}

class CreateUserInitial extends CreateUserState {
  @override
  List<Object?> get props => [];
}

class CreateUserLoading extends CreateUserState {
  @override
  List<Object?> get props => [];
}

class CreateUserSucess extends CreateUserState {
  @override
  List<Object?> get props => [];
}

class CreateUserFailure extends CreateUserState {
  final String message;

  const CreateUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class CreateUserValidationFailure extends CreateUserState {
  final String message;

  const CreateUserValidationFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
