import 'package:flutter/material.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/show_modal_button_sheet.dart';
import 'package:to_do_app/features/to_do_feature/presentation/widgets/to_do_view_body.dart';

class ToDoHome extends StatelessWidget {
  const ToDoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AddToDoButtonSheet(),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: ToDoViewBody(),
      ),
    );
  }
}
