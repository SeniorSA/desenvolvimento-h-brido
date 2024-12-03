import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rn_flutter_sdk/models/_api_list_model_.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
          id: e['id'],
          title: e['title'],
          userId: e['userId'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }
    return [];
    // throw "Something went wrong";
  }
}
