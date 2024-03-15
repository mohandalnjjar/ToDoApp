abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class HiveFailure extends Failure {
  HiveFailure({required super.errorMessage});
}
