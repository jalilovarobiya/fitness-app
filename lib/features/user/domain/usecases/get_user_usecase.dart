import 'package:dartz/dartz.dart';
import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/user/domain/entities/user_entity.dart';
import 'package:fitness_app/features/user/domain/repository/user_repository.dart';

class GetUserUsecase {
  final UserRepository repository;

  GetUserUsecase(this.repository);

  Future<Either<Failures, UserEntity>> call(String userId) async {
    return await repository.getUser(userId);
  }
}
