abstract class AddToDoState {}

 class AddToDoInitial extends AddToDoState {}

class AddToDoLoading extends AddToDoState {}

class AddToDoSuccess extends AddToDoState {}

class AddToDoFailure extends AddToDoState {
  final String errorMessage;

  AddToDoFailure({required this.errorMessage,});
}
