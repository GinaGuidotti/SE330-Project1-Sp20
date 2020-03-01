import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStore {
  final FlutterSecureStorage storage;
  AuthStore({this.storage});
  final sessionIdKey = 'sessionID';

  Future<String> getSessionID() async {
    return await this.storage.read(key: this.sessionIdKey);
  }

  Future<Null> setSessionID(String sessionID) async {
    await this.storage.write(key: this.sessionIdKey, value: sessionID);
  }
}