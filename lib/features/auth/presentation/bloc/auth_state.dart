part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

final class Authenticated extends AuthState {
  final String userId;

  Authenticated({required this.userId});
}

final class Unauthenticated extends AuthState {}
