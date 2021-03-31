import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_list/application/auth/bloc/auth_bloc.dart';
import 'package:todo_list/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:todo_list/presentation/routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
                    (failure) => FlushbarHelper.createError(
                        message: failure.map(
                            cancelledByUser: (_) => 'Cancelled',
                            serverError: (_) => 'Server error',
                            emailAlreadyInUse: (_) => 'Email already in use',
                            invalidEmailAndPassword: (_) =>
                                'Invalid email and password combination')).show(
                        context), (_) {
                  ExtendedNavigator.of(context)
                      .replace(Routes.notesOverviewPage);
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.authCheckRequested());
                }));
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Stack(
                  children: [
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: 70.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    autocorrect: false,
                    validator: (_) => context
                        .read<SignInFormBloc>()
                        .state
                        .emailAddress
                        .value
                        .fold(
                            (f) => f.maybeMap(
                                invalidEmail: (_) => 'Invalid Email',
                                orElse: () => null),
                            (r) => null),
                    onChanged: (value) => context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.emailChanged(value.toString())),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    autocorrect: false,
                    validator: (_) => context
                        .read<SignInFormBloc>()
                        .state
                        .password
                        .value
                        .fold(
                            (f) => f.maybeMap(
                                shortPassword: (_) => 'Short Password',
                                orElse: () => null),
                            (r) => null),
                    onChanged: (value) => context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.passwordChanged(value.toString())),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Center(
                    child: const CircularProgressIndicator(),
                  )
                ],
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    color: Colors.yellow,
                    padding: const EdgeInsets.fromLTRB(40, 16, 16, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                      ),
                    ),
                    onPressed: () => context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.signInWithEmailAndPassword()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'SIGN IN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    color: Colors.yellow,
                    padding: const EdgeInsets.fromLTRB(23, 16, 16, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                      ),
                    ),
                    onPressed: () => context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.registerWithEmailAndPassword()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'REGISTER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: OutlineButton.icon(
                    onPressed: () => context
                        .read<SignInFormBloc>()
                        .add(SignInFormEvent.singInWithGmail()),
                    icon: Icon(
                      FontAwesomeIcons.googlePlusG,
                      size: 18.0,
                    ),
                    label: Text('Google'),
                    borderSide: BorderSide(color: Colors.red),
                    textColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
