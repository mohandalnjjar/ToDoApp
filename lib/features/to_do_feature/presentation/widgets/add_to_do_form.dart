import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit_states.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'Add Task',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFromField(
              onSaved: (value) => title = value,
              hint: 'What to do',
            ),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                BlocProvider.of<AddToDoCubit>(context)
                    .addToDoMethod(ToDoModel(title: title!));

              } else {
                autoValidate = AutovalidateMode.always;
                setState(() {});
              }
            },
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            child: BlocBuilder<AddToDoCubit, AddToDoState>(
              builder: (context, state) {
                if (state is AddToDoLoading) {
                  return const Text('laoding');
                } else {
                  return const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
