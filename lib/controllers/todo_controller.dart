
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:to_do_app/models/todo.dart';


class TodoController extends GetxController {
  final String apiUrl ='http://localhost:3000/tasks';

  // Observe the list of todos
  RxList<Todo> todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch the list of tasks from the server when the controller is initialized
    fetchTodos();
  }

  // Fetch all todos from the server
  Future<void> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        todos.assignAll(
          decodedData.map((data) => Todo.fromJson(data)).toList(),
        );
      } else {
        // Handle error (e.g., display a snackbar or toast message).
        print('Error fetching todos: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error (e.g., display a snackbar or toast message).
      print('Error fetching todos: $e');
    }
  }

  // Add a new todo to the server
  Future<void> addTodo(String taskName) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'taskName': taskName}),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        todos.add(Todo.fromJson(decodedData));
      } else {
        // Handle error (e.g., display a snackbar or toast message).
        print('Error adding todo: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error (e.g., display a snackbar or toast message).
      print('Error adding todo: $e');
    }
  }

  // Delete a todo from the server
  Future<void> deleteTodoById(int id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        todos.removeWhere((todo) => todo.id == id);
      } else {
        // Handle error (e.g., display a snackbar or toast message).
        print('Error deleting todo: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error (e.g., display a snackbar or toast message).
      print('Error deleting todo: $e');
    }
  }
}

