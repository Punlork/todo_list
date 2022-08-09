import 'package:dio/dio.dart';
import 'package:todo_list/storage_util.dart';
import '../common/http_client.dart';

import '../data/model/todo/todo_req_model.dart';
import '../data/model/todo/todo_res_model.dart';
import '../exceptions/bad_request_exception.dart';

class TodoService {
  final HttpService _httpService;

  TodoService(this._httpService);

  Future<TodoResModel> getTodo() async {
    final token = StorageUtil.getString('accessToken');
    final response = await _httpService.get(
      '/tasks',
      options: Options(headers: {"Authorization": "bearer $token"}),
    );
    try {
      Future.delayed(const Duration(seconds: 3));
      if (response.statusCode == 200) {
        Map<String, dynamic> res = response.data;
        return TodoResModel.fromJson(res);
      } else {
        throw RestBadRequestException(
            message: response.statusMessage ?? 'Request Fail');
      }
    } catch (e) {
      throw RestBadRequestException(
          message: response.statusMessage ?? 'Error Unexpected ');
    }
  }

  Future<bool> createTodo({required ProductReqModel reqItem}) async {
    final token = StorageUtil.getString('accessToken');
    try {
      final response = await _httpService.post(
        '/tasks',
        data: reqItem.toJson(),
        options: Options(headers: {"Authorization": "bearer $token"}),
      );
      // print(response.data);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw RestBadRequestException(
            message: response.statusMessage ?? 'Request fail');
      }
    } catch (e) {
      throw RestBadRequestException(message: e.toString());
    }
  }

  Future<bool> deleteTodo({required int todoId, required String token}) async {
    try {
      final response = await _httpService.post(
        'tasks/:id',
        options: Options(headers: {'token': token}),
        data: {'id': todoId},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw RestBadRequestException(
            message: response.statusMessage ?? 'Request fial');
      }
    } catch (e) {
      throw RestBadRequestException(message: e.toString());
    }
  }
}
