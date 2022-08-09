import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/http_client.dart';
import '../../../data/model/todo/todo_req_model.dart';
import '../../../services/todo_service.dart';

part 'create_item_state.dart';

class CreateItemCubit extends Cubit<CreateItemState> {
  CreateItemCubit() : super(CreateTodoInitial());

  late Dio _dio = Dio();
  late HttpService _httpService;
  late TodoService _service;

  void init() {
    _dio = Dio();
    _httpService = HttpService(_dio);
    _service = TodoService(_httpService);
  }

  void addTodo(ProductReqModel todo) async {
    init();
    emit(CreateTodoLoading());
    try {
      if (todo.title.isEmpty) {
        emit(const CreateTodoValidationFailure(message: 'Name is required'));
        return;
      }

      final result = await _service.createTodo(reqItem: todo);

      if (result) {
        emit(CreateTodoSuccess());
      } else {
        emit(const CreateTodoFailure(message: 'Cannot create Todo'));
      }
    } catch (e) {
      emit(
        CreateTodoFailure(message: e.toString()),
      );
    }
  }
}
