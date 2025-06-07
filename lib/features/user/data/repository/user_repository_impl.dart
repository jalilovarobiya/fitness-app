import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/user/data/datasources/user_remote_datasource.dart';
import 'package:fitness_app/features/user/data/model/user_model.dart';
import 'package:fitness_app/features/user/domain/entities/user_entity.dart';
import 'package:fitness_app/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failures, UserEntity>> getUser(String userId) async {
    try {
      final result = await remoteDatasource.getUser(userId);
      return Right(result);
    } catch (e) {
      return Left(SaverFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateUser(UserEntity user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
        createdAt: user.createdAt,
      );
      await remoteDatasource.updateUser(userModel);
      return Right(null);
    } catch (e) {
      return Left(SaverFailure(message: e.toString()));
    }
  }
}
