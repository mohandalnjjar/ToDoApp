import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/data/repos/add_to_do_repo_impl.dart';
import 'package:to_do_app/features/to_do_feature/presentation/manager/add_to_do_cubit/add_to_do_cubit_states.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit({required this.addToDoImpl}) : super(AddToDoInitial());

  final AddToDoImpl addToDoImpl;

  Future<void> addToDoMethod(ToDoModel toDo) async {
    emit(AddToDoLoading());

    var result = await addToDoImpl.addToDo(toDo);

    result.fold(
      (failure) {
        emit(
          AddToDoFailure(errorMessage: failure.errorMessage),
        );
      },
      (right) {
        emit(
          AddToDoSuccess(),
        );
      },
    );
  }
}
