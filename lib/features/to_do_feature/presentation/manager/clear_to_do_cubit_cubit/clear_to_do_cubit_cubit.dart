import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';

part 'clear_to_do_cubit_state.dart';

class ClearToDoCubitCubit extends Cubit<ClearToDoCubitState> {
  ClearToDoCubitCubit() : super(ClearToDoCubitInitial());


  clearToDoMethod() async {
    var toDoBox = Hive.box<ToDoModel>(kToDoBox);
    await toDoBox.clear();
  }
}
