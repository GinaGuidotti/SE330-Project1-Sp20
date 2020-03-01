import 'package:se330_project1/auth/auth_status.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:se330_project1/auth/auth_store.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



class AuthService {
  // Future<AuthStatus> loginAndGetSessionID(String username, String password) async {    
  //   var url = 'http://staging.peacebrookingscalendar.org/api/LoginAndGetSessionID.php'; 
  //   Map<String,dynamic> formData = {};
  //   formData["username"] = username;
  //   formData["password"] = password;
  //   var response = await http.post(
  //     Uri.encodeFull(url),
  //     body: formData 
  //   );
  //   if (response.statusCode == 200){
  //     return AuthStatus(sessionID: response.body);
  //   } else{
  //     return AuthStatus(sessionID: '');
  //   }
  // }

  //make an api for making the session id invalid? not sure
  //add here for 
// Future<AuthStatus> logoutService() async {    
//     var url = 'https://staging.peacebrookingscalendar.org/api/Logout.php';
//     Map<String, String> headers = {};        
//     final authStore = AuthStore(storage: FlutterSecureStorage());
//     headers['Cookie'] = 'PHPSESSID=' + await authStore.getSessionID();    
//     http.Response logoutResponse = await http.post(url, headers: headers);
//     if (logoutResponse.statusCode == 200){
//       print("Successfully obtained logout response.");
//       print("But here's the actual status of whether log out succeeded: ");
//       print(jsonDecode(logoutResponse.body));
//       return AuthStatus(sessionID: ''); 
//     } else{
//       print("Failed to obtain logout response");
//       return AuthStatus(sessionID: ''); 
//     }
//   }
Future<AuthStatus> loginAndGetSessionID(String username, String password) async {    
     
      return AuthStatus(sessionID: ''); 
  }

Future<AuthStatus> logoutService() async {    
      return AuthStatus(sessionID: ''); 
    
  }

 
}
