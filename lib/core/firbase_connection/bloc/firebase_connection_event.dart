part of 'firebase_connection_bloc.dart';

abstract class FirebaseConnectionEvent extends Equatable {
  const FirebaseConnectionEvent();
}
class StartConnecting extends FirebaseConnectionEvent {
  @override
  List<Object> get props => [];
}
