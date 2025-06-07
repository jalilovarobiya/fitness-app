import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failures, String>> login(String email, String password) async {
    try {
      final result = await remoteDatasource.login(email, password);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final result = await remoteDatasource.register(email, password, name);
      return Right(result);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> logOut() async {
    try {
      await remoteDatasource.logout();
      return Right(null);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  // TODO: implement authStateChange
  Stream<String?> get authStateChange => remoteDatasource.authStateChanges;
}
