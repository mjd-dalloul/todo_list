import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/firbase_connection/bloc/firebase_connection_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<FirebaseConnectionBloc>(
          create: (_) => FirebaseConnectionBloc()..add(StartConnecting()),  //todo dependency injection
          child: Root()
      ),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<FirebaseConnectionBloc, FirebaseConnectionState>(
        builder: (context, state) {
          if(state is ConnectingToFirebase) {
            return Center(child: CircularProgressIndicator(),);
          } else if(state is ConnectionDone) {
            return Center(child: Text('DONE'),);
          } else if(state is ConnectionFailed) {
            return Center(child: Text('${state.massage}'),);
          } else return Container();
        },
      ),
    );
  }
}
