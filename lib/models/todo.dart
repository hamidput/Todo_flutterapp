class Todo {
  final int id;
  final String taskName;
  final bool completed;

  Todo({
    required this.id,
    required this.taskName,
    required this.completed,
  });

  // Factory constructor to create a Todo object from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      taskName: json['taskName'],
      completed: json['completed'],
    );
  }
}
