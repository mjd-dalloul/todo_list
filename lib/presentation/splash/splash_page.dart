import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/auth/bloc/auth_bloc.dart';
import 'package:todo_list/presentation/routes/router.gr.dart';

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
              ExtendedNavigator.of(context).replace(Routes.notesOverviewPage),
          unauthenticated: (_) => ExtendedNavigator.of(context).replace(Routes.signInPage),
        );
      },
      child: const Scaffold(
        body: const Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}