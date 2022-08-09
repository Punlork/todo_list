import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/http_client.dart';
import '../../../data/model/todo/todo_res_model.dart';
import '../../../exceptions/bad_request_exception.dart';
import '../../../services/todo_service.dart';

part 'all_todo_state.dart';

class AllTodoCubit extends Cubit<AllTodoState> {
  AllTodoCubit() : super(AllTodoInitial()) {
    _dio = Dio();
    _httpService = HttpService(_dio);
    _service = TodoService(_httpService);
  }

  late Dio _dio = Dio();
  late HttpService _httpService;
  late TodoService _service;

  Future<void> showAll() async {
    emit(const AllTodoLoading());
    // saveTodoToken;
    try {
      final response = await _service.getTodo();
      if (response.data.isNotEmpty) {
        emit(AllTodoLoaded(data: response.data));
      } else {
        emit(AllTodoEmpty());
      }
    } catch (e) {
      emit(const AllTodoFailure(message: ' Error '));
    }
  }
}
