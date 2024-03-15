import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/presentation/views/home_view.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox(kToDoBox);
  Hive.registerAdapter(ToDoModelAdapter());
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
