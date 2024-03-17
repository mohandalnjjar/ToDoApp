import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/core/utilis/simple_bloc_opserver.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/clear_to_do_cubit_cubit/clear_to_do_cubit_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/fetch_to_do_cubit/fetch_to_do_cubit_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/views/home_view.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  Bloc.observer = BlocOpserver();
  Hive.registerAdapter(ToDoModelAdapter());

  await Hive.openBox<ToDoModel>(kToDoBox);
  runApp(
    const TodoAPP(),
  );
}

class TodoAPP extends StatelessWidget {
  const TodoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchToDoCubit()..fetchToDoMehod(),
        ),
        BlocProvider(
          create: (context) => ClearToDoCubitCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home: const ToDoHome(),
      ),
    );
  }
}
