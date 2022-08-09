part of 'create_item_cubit.dart';

abstract class CreateItemState extends Equatable {
  const CreateItemState();
}

class CreateTodoInitial extends CreateItemState {
  @override
  List<Object?> get props => [];
}

class CreateTodoLoading extends CreateItemState {
  @override
  List<Object?> get props => [];
}

class CreateTodoSuccess extends CreateItemState {
  @override
  List<Object?> get props => [];
}

class CreateTodoFailure extends CreateItemState {
  final String message;

  const CreateTodoFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class CreateTodoValidationFailure extends CreateItemState {
  final String message;

  const CreateTodoValidationFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
