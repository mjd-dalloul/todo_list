import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

part 'firebase_connection_event.dart';
part 'firebase_connection_state.dart';
@injectable
class FirebaseConnectionBloc extends Bloc<FirebaseConnectionEvent, FirebaseConnectionState> {
  FirebaseConnectionBloc() : super(FirebaseConnectionInitial());
  @override
  Stream<FirebaseConnectionState> mapEventToState(
    FirebaseConnectionEvent event,
  ) async* {
      if(event is StartConnecting) {
        yield ConnectingToFirebase();
        try{
        final result = await Firebase.initializeApp();
        yield ConnectionDone();
        } catch(e) {
        yield ConnectionFailed(massage: "Con not Connect to firebase");
        }
      }
  }
}
