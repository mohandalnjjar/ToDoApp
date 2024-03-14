import 'package:flutter/material.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/custom_text_field.dart';

class ShowModalButtonSheet extends StatelessWidget {
  const ShowModalButtonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: CustomTextFromField(
            hint: 'What to do',
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            "Add",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ]),
    );
  }
}
