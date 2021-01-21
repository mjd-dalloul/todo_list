import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/presentation/auth/sign_in_page.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
        ),
      ),
      home: SignInPage(),
    );
  }
}