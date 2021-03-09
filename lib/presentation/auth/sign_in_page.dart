import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:todo_list/presentation/auth/widgets/sign_in_form.dart';

import '../../injection.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(getIt<SignInFormBloc>());
    return Scaffold(
      body: BlocProvider<SignInFormBloc>(
        create: (context) => getIt(),
        child: SignInForm(),
      ),
    );
  }
}
