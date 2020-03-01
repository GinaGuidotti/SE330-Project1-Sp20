import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginFromLoginScreen extends AuthEvent {
  final String username;
  final String password;

  const LoginFromLoginScreen(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class LogoutFromLogoutScreen extends AuthEvent { 
  const LogoutFromLogoutScreen();

  @override
  List<Object> get props => [];
}

class TestLoginFromChangePassword extends AuthEvent{
  final String username;
  final String password;

  const TestLoginFromChangePassword(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class LogoutFromChangePassword extends AuthEvent { 
  const LogoutFromChangePassword();

  @override
  List<Object> get props => [];
}
