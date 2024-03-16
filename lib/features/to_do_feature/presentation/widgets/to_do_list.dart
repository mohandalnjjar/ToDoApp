import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/fetch_to_do_cubit/fetch_to_do_cubit_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/to_do_list_item.dart';

class TODoList extends StatefulWidget {
  const TODoList({super.key});

  @override
  State<TODoList> createState() => _TODoListState();
}

class _TODoListState extends State<TODoList> {
  @override
  Widget build(BuildContext context) {
    List<ToDoModel>? toDos = BlocProvider.of<FetchToDoCubit>(context).toDoList;

    return BlocBuilder<FetchToDoCubit, FetchToDoCubitState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: toDos!.length,
          itemBuilder: (context, index) {
            return ToDoListItem(
              title: toDos[index].title,
              isChecked: toDos[index].isDone,
              onChange: (value) async {
                setState(
                  () {
                    toDos[index].isDoneMethod();
                    toDos[index].save();
                  },
                );
                await Timer(const Duration(milliseconds: 500), () {
                  toDos[index].delete();
                  BlocProvider.of<FetchToDoCubit>(context).fetchToDoMehod();
                });
              },
            );
          },
        );
      },
    );
  }
}
