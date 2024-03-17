import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/core/utilis/widgets/custom_app_bar.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/clear_to_do_cubit_cubit/clear_to_do_cubit_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/fetch_to_do_cubit/fetch_to_do_cubit_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/to_do_list.dart';

class ToDoViewBody extends StatelessWidget {
  const ToDoViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchToDoCubit, FetchToDoCubitState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: 'To Do Day',
              icon: Icons.playlist_add_check,
              iconSize: 35,
              onpressed: () async {
                await BlocProvider.of<ClearToDoCubitCubit>(context)
                    .clearToDoMethod();
                BlocProvider.of<FetchToDoCubit>(context).fetchToDoMehod();
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                '0 tasks',
                style: TextStyle(fontSize: 21),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 50),
                decoration: BoxDecoration(
                  color: kSecondPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TODoList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
