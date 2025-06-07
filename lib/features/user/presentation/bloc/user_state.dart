part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserEntity user;

  UserSuccess({required this.user});
}

final class UserError extends UserState {
  final String error;

  UserError({required this.error});
}
