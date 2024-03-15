import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/errors/failures.dart';
import 'package:to_do_app/features/to_do_feature/data/models/to_do_model.dart';

abstract class ToDoRepo {
  Future<Either<Failure, void>> addToDo(ToDoModel toDo);
}
