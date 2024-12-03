import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rn_flutter_sdk/provider/_api_list_provider_.dart';

class ApiListPage extends StatefulWidget {
  const ApiListPage({Key? key}) : super(key: key);

  @override
  State<ApiListPage> createState() => _HomePageState();
}

class _HomePageState extends State<ApiListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiListProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider list API'),
      ),
      body: Consumer<ApiListProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todos = value.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(todo.id.toString()),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    color: todo.completed ? Colors.grey : Colors.black,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
