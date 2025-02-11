part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterEvent(this.email, this.password);
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent(this.email, this.password);
}
class CheckAuthEvent extends AuthEvent {}

