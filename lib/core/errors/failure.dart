abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errorMessage});
}

class FormatFailure extends Failure {
  FormatFailure({required super.errorMessage});
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.errorMessage});
}
