import 'package:flutter/material.dart';
import 'package:my_personal_challenges/data/task_inherited.dart';
import 'package:my_personal_challenges/screens/form-screen.dart';

import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Tarefas"),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),

      ),
    )
    ;
  }
}
