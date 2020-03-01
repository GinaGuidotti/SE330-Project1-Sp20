import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:se330_project1/auth/auth_service.dart';
import 'package:se330_project1/auth/auth_store.dart';
import 'package:se330_project1/auth/bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService auth;
  final authStore = AuthStore(storage: FlutterSecureStorage());
  AuthBloc(this.auth);
  bool successfulTestLogin;

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginFromLoginScreen) {
      final authStatus = await auth.loginAndGetSessionID(event.username, event.password);
      if (authStatus.sessionID == '') {
        yield LoginErrorAtLoginScreen();
      } else {
        await this.authStore.setSessionID(authStatus.sessionID);
        yield LoggedInFromLoginScreen(authStatus);
      }
    } 
    else if(event is LogoutFromLogoutScreen){
      final authStatus = await auth.logoutService();
      await this.authStore.setSessionID(authStatus.sessionID); 
      yield LoggedOutScreen();
    } 
    else if (event is TestLoginFromChangePassword) {       
      final authStatus = await auth.loginAndGetSessionID(event.username, event.password);
      if (authStatus.sessionID == '') { 
        successfulTestLogin = false;
        yield LoginErrorAtChangePassword();
      } else { 
        successfulTestLogin = true;
        await this.authStore.setSessionID(authStatus.sessionID);
        yield LoggedInFromChangePassword(authStatus);
      }
    }
    else if (event is LogoutFromChangePassword){
      final authStatus = await auth.logoutService(); 
      await this.authStore.setSessionID(authStatus.sessionID); 
      yield LoggedOutScreen();
    } 
  }
}
