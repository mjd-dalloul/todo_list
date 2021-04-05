import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/auth/bloc/auth_bloc.dart';
import 'package:todo_list/application/notes/note_actor/note_actor_bloc.dart';
import 'package:todo_list/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:todo_list/injection.dart';
import 'package:todo_list/presentation/notes/notes_over_view/widgets/notes_overview_body_widget.dart';
import 'package:todo_list/presentation/notes/notes_over_view/widgets/uncompleted_switch.dart';
import 'package:todo_list/presentation/routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider(create: (context) => sl<NoteActorBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                  unauthenticated: () =>
                      ExtendedNavigator.of(context).replace(Routes.signInPage),
                  orElse: () {});
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                  deleteFailure: (state) {
                    FlushbarHelper.createError(
                      duration: const Duration(seconds: 5),
                      message: state.failure.map(
                          unexpected: (_) => 'unexpected',
                          insufficientPermission: (_) =>
                              'insufficient Permission',
                          unableToUpdate: (_) => 'unable To Update'),
                    ).show(context);
                  },
                  orElse: () {});
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: [
              UncompletedSwitch(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: NotesOverViewBody(),
        ),
      ),
    );
  }
}
