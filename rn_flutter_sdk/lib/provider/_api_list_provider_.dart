import 'package:flutter/material.dart';
import 'package:rn_flutter_sdk/models/_api_list_model_.dart';
import 'package:rn_flutter_sdk/services/_api_list_services_.dart';

class ApiListProvider extends ChangeNotifier {
  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
