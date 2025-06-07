import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/di/service_locator.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitness_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fitness_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fitness_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final LogoutUsecase logoutUsecase;
  // StreamSubscription listen qlnvotgan stremga controller boberad
  // foydalanuvchi appga krganda va chqganda signal berb turad
  StreamSubscription? authstreamSubscription;

  AuthBloc({
    required this.loginUsecase,
    required this.registerUsecase,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    authstreamSubscription = sl.get<AuthRepository>().authStateChange.listen((
      userId,
    ) {
      add(StatusChanged(userId: userId));
    });

    on<Login>(_login);
    on<Register>(_register);
    on<Logout>(_logout);
    on<StatusChanged>(_statusChanged);
  }

  Future<void> _login(Login event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginUsecase(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (userId) => emit(Authenticated(userId: userId)),
    );
  }

  Future<void> _register(Register event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await registerUsecase(
      email: event.email,
      password: event.password,
      name: event.name,
    );

    result.fold(
      (fauiler) => emit(AuthError(message: fauiler.message)),
      (userId) => emit(Authenticated(userId: userId)),
    );
  }

  Future<void> _logout(Logout evevnt, Emitter<AuthState> emit) async {
    await logoutUsecase();
  }

  Future<void> _statusChanged(
    StatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.userId != null) {
      emit(Authenticated(userId: event.userId!));
    } else {
      emit(Unauthenticated());
    }
  }

  @override
  Future<void> close() {
    authstreamSubscription?.cancel();
    return super.close();
  }
}
