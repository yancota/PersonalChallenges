import 'package:flutter/material.dart';
import 'package:my_personal_challenges/data/task_inherited.dart';
import 'package:my_personal_challenges/screens/form-screen.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ).copyWith(secondary: Colors.orange,
                ),
          scaffoldBackgroundColor: Colors.white,
      ),
      home: TaskInherited(child: const InitialScreen())
    );
  }
}





