abstract class AddToDoState {}

class AddToDoInisial extends AddToDoState {}

class AddToDoLoading extends AddToDoState {}

class AddToDoSuccess extends AddToDoState {}

class AddToDoFailure extends AddToDoState {
  final String errorMessage;

  AddToDoFailure({required this.errorMessage,});
}
