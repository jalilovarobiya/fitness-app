import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fitness_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitness_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fitness_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fitness_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/user/data/datasources/user_remote_datasource.dart';
import 'package:fitness_app/features/user/data/repository/user_repository_impl.dart';
import 'package:fitness_app/features/user/domain/repository/user_repository.dart';
import 'package:fitness_app/features/user/domain/usecases/get_user_usecase.dart';
import 'package:fitness_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );

  sl.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDatasource>()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl<UserRemoteDatasource>()),
  );

  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => GetUserUsecase(sl()));

  sl.registerFactory(
    () => AuthBloc(
      loginUsecase: sl(),
      registerUsecase: sl(),
      logoutUsecase: sl(),
    ),
  );
  sl.registerFactory(() => UserBloc(usecase: sl<GetUserUsecase>()));
}
