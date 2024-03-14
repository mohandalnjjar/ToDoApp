import 'package:flutter/material.dart';
import 'package:to_do_app/core/utilis/constance.dart';
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
      child: const SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}
