import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/auth/bloc/auth_bloc.dart';
import 'package:todo_list/injection.dart';
import 'package:todo_list/presentation/auth/sign_in_page.dart';
import 'package:todo_list/presentation/splash/splash_page.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        getIt<AuthBloc>()
          ..add(const AuthEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          SplashPage.route : (context) => SplashPage(),
          SignInPage.route: (context) => SignInPage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              )
          ),
        ),
      ),
    );
  }
}