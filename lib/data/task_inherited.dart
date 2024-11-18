
import 'package:flutter/material.dart';
import 'package:my_personal_challenges/components/Task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
        "Estudar Programação",
        'assets/images/flutter.png',
        5),
    Task(
        "Ler a Bíblia",
        'assets/images/biblia.jpg',
        3),
    Task(
        "Estudar Inglês",
        'assets/images/ingles.png',
        2),
    Task(
        "Ir na Academia",
        'assets/images/academia.png',
        4)
  ];

  void newTask(String name, String img, int difficulty){
    taskList.add(Task(name, img, difficulty));
  }

  static  of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No  found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;;
  }
}
