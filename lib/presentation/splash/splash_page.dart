import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/auth/bloc/auth_bloc.dart';
import 'package:todo_list/presentation/auth/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {
          },
          authenticated: (_) =>
              print('AUTHENTICAtED'),
          unauthenticated: (_) => Navigator.of(context).popAndPushNamed(SignInPage.route),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}