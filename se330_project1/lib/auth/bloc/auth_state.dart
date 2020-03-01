import 'package:se330_project1/auth/auth_status.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInFromLoginScreen extends AuthState {
  final AuthStatus authStatus;
  const LoggedInFromLoginScreen(this.authStatus);
  @override
  List<Object> get props => [authStatus];
}

class LoginErrorAtLoginScreen extends AuthState {
  const LoginErrorAtLoginScreen();
    @override
  List<Object> get props => [];
}

class LoggedOutFromLogoutScreen extends AuthState {
   final AuthStatus authStatus;
  const LoggedOutFromLogoutScreen(this.authStatus);
  @override
  List<Object> get props => [authStatus];
}

class LoggedOutScreen extends AuthState {
  const LoggedOutScreen();
    @override
  List<Object> get props => [];
}

class LoggedInFromChangePassword extends AuthState {
  final AuthStatus authStatus;
  const LoggedInFromChangePassword(this.authStatus);
  @override
  List<Object> get props => [authStatus];
}

class LoginErrorAtChangePassword extends AuthState { 
  const LoginErrorAtChangePassword();
    @override
  List<Object> get props => [];
}
