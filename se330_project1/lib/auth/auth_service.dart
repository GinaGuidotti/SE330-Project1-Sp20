import 'package:se330_project1/auth/auth_status.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:se330_project1/auth/auth_store.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'dart:async';



class AuthService { 
Future<AuthStatus> loginAndGetSessionID(String username, String password) async {    
     
      return AuthStatus(sessionID: ''); 
  }

Future<AuthStatus> logoutService() async {    
      return AuthStatus(sessionID: ''); 
    
  }

 
}
