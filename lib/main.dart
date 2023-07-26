import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/views/todo_list_screen.dart';
import 'package:to_do_app/routes/app_routes.dart';

import 'bindings/todo_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.todoList,
      initialBinding: TodoBinding(), // Add the binding here
      getPages: [
        GetPage(name: AppRoutes.todoList, page: () => TodoListScreen()),
        // Add other routes if needed
      ],
    );
  }
}
