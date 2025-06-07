part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class FetchUsers extends UserEvent {
  final String userId;

  FetchUsers({required this.userId});
}
