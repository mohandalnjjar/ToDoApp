import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/errors/failures.dart';
import 'package:to_do_app/core/utilis/constance.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';
import 'package:to_do_app/features/to_do_feature/data/repos/add_to_do_repo.dart';

class AddToDoImpl implements ToDoRepo {
  @override
  Future<Either<Failure, void>> addToDo(ToDoModel toDo) async {
    try {
      var toDos = Hive.box<ToDoModel>(kToDoBox);
      await toDos.add(toDo);
      return right(null);
    } catch (e) {
      return left(
        HiveFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
