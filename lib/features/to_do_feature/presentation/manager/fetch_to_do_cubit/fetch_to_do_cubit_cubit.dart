import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';

part 'fetch_to_do_cubit_state.dart';

class FetchToDoCubit extends Cubit<FetchToDoCubitState> {
  FetchToDoCubit() : super(FetchToDoCubitInitial());

  List<ToDoModel>? toDoList;
  fetchToDoMehod() {
    var toDoBox = Hive.box<ToDoModel>(kToDoBox);
    toDoList = toDoBox.values.toList();
     emit(
      FetchToDoCubitSuccess(),
    );
  }
}
