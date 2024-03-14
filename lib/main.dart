import 'package:flutter/material.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/to_do/home_view.dart';

void main(List<String> args) {
  runApp(
    const ToDoAPP(),
  );
}

class ToDoAPP extends StatelessWidget {
  const ToDoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home: const ToDoHome(),
    );
  }
}
