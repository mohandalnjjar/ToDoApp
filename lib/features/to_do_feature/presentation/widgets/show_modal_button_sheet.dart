import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit_states.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/add_to_do_form.dart';

class AddToDoButtonSheet extends StatelessWidget {
  const AddToDoButtonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: SingleChildScrollView(
        child: BlocConsumer<AddToDoCubit, AddToDoState>(
          listener: (context, state) {
            if (state is AddToDoSuccess) {
              Navigator.pop(context);
            }
            if (state is AddToDoFailure) {
              print(state.errorMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddToDoLoading ? true : false,
              child: const AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
