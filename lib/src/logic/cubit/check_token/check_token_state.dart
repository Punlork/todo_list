part of 'check_token_cubit.dart';

abstract class CheckTokenState extends Equatable {
  const CheckTokenState();
}

class CheckTokenInitial extends CheckTokenState {
  @override
  List<Object?> get props => [];
}

class CheckTokenLoading extends CheckTokenState {
  @override
  List<Object?> get props => [];
}

class CheckTokenAuthenticated extends CheckTokenState {
  @override
  List<Object?> get props => [];
}

class CheckTokenUnAuthenticated extends CheckTokenState {
  @override
  List<Object?> get props => [];
}

class CheckTokenFailure extends CheckTokenState {
  @override
  List<Object?> get props => [];
}
