import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, String>> login(String email, String password);
  Future<Either<Failures, String>> register(
    String email,
    String password,
    String name,
  );
  Future<Either<Failures, void>> logOut();
  Stream<String?> get authStateChange;
}
