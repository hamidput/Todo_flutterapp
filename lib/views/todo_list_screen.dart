import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/todo_controller.dart';

class TodoListScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('To-Do List'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return ListTile(
              title: Text(todo.taskName),
              trailing: IconButton(
                icon:const Icon(Icons.delete),
                onPressed: () {
                  todoController.deleteTodoById(todo.id);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child:const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskNameController,
            decoration:const InputDecoration(labelText: 'Task Name'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                todoController.addTodo(taskNameController.text);
                Navigator.pop(context);
              },
              child:const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
