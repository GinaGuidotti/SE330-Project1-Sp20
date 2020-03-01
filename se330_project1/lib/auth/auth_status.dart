import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AuthStatus extends Equatable {
  final String sessionID; 

  AuthStatus({
    @required this.sessionID,
  });

  @override
  List<Object> get props => [
        sessionID,
      ];
}