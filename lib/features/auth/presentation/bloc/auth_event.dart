part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});
}

class Register extends AuthEvent {
  final String name;
  final String password;
  final String email;

  Register({required this.name, required this.password, required this.email});
}

class Logout extends AuthEvent {}

class StatusChanged extends AuthEvent {
  final String? userId;

  StatusChanged({required this.userId});
}
