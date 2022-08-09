part of 'all_todo_cubit.dart';

abstract class AllTodoState extends Equatable {
  const AllTodoState();
}

class AllTodoInitial extends AllTodoState {
  @override
  List<Object?> get props => [];
}

class AllTodoLoading extends AllTodoState {
  const AllTodoLoading();
  @override
  List<Object?> get props => [];
}

class AllTodoLoaded extends AllTodoState {
  final List<TodoModel> data;

  const AllTodoLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AllTodoEmpty extends AllTodoState {
  @override
  List<Object?> get props => [];
}

class AllTodoFailure extends AllTodoState {
  final String message;

  const AllTodoFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
