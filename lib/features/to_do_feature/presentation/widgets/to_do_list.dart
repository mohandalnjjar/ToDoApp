import 'package:flutter/material.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/to_do_list_item.dart';

class TODoList extends StatelessWidget {
  const TODoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ToDoListItem(
              isChecked: true, title: "this is me folan el folani");
        });
  }
}
