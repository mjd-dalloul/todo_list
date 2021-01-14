part of 'firebase_connection_bloc.dart';

abstract class FirebaseConnectionState extends Equatable {
  const FirebaseConnectionState();
}

class FirebaseConnectionInitial extends FirebaseConnectionState {
  @override
  List<Object> get props => [];
}
class ConnectingToFirebase extends FirebaseConnectionState {
  @override
  List<Object> get props => [];
}
class ConnectionFailed extends FirebaseConnectionState {
  final String massage;
  ConnectionFailed({this.massage});
  @override
  List<Object> get props => [massage];
}

class ConnectionDone extends FirebaseConnectionState {
  @override
  List<Object> get props => [];
}

