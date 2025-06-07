import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failures, UserEntity>> getUser(String userId);
  Future<Either<Failures, void>> updateUser(UserEntity user);
}
