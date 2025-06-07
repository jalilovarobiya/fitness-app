abstract class Failures {
  final String message;

  Failures({required this.message});
}

class SaverFailure extends Failures {
  SaverFailure({required super.message});
}

class AuthFailure extends Failures {
  AuthFailure({required super.message});
}
