import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/data/repos/add_to_do_repo_impl.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/views/home_view.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox<ToDoModel>(kToDoBox);
  Hive.registerAdapter(ToDoModelAdapter());
  runApp(
    const ToDoAPP(),
  );
}

class ToDoAPP extends StatelessWidget {
  const ToDoAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddToDoCubit(addToDoImpl: AddToDoImpl()),
        ),
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
