import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:todo_list/injection.dart';
import 'package:todo_list/presentation/notes/notes_form/misc/todo_item_presentation_classes.dart';
import 'package:todo_list/presentation/notes/notes_over_view/widgets/body_field_widget.dart';
import 'package:todo_list/presentation/notes/widgets/add_todo_tile.dart';
import 'package:todo_list/presentation/notes/widgets/todo_list_widget.dart';
import 'package:todo_list/presentation/routes/router.gr.dart';

import 'notes_over_view/widgets/color_field_widget.dart';

class NoteFormPage extends StatelessWidget {
  final Note editedNote;

  const NoteFormPage({
    @required this.editedNote,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editedNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
          listenWhen: (p, c) =>
              p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(
              () => {},
              (either) {
                either.fold(
                  (failure) {
                    FlushbarHelper.createError(
                      message: failure.map(
                          unexpected: (_) =>
                              'Unexpected error occurred, please contact support',
                          insufficientPermission: (_) =>
                              'Insufficient permission ❌',
                          unableToUpdate: (_) =>
                              'Couldn\'t update the note. Was it deleted from author'),
                    ).show(context);
                  },
                  (_) => ExtendedNavigator.of(context).popUntil((route) =>
                      route.settings.name == Routes.notesOverviewPage),
                );
              },
            );
          },
          buildWhen: (p, c) => p.isSaving != c.isSaving,
          builder: (context, state) {
            return Stack(
              children: [
                const NoteFormPageScaffold(),
                SavingInProgressOverLay(
                  isSaving: state.isSaving,
                ),
              ],
            );
          }),
    );
  }
}

class SavingInProgressOverLay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverLay({@required this.isSaving});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (old, newState) => old.isEditing != newState.isEditing,
          builder: (context, state) =>
              Text(state.isEditing ? 'Edit a note' : 'Create a note'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => FormTodos(),
              child: Form(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const BodyField(),
                    const ColorField(),
                    const TodoList(),
                    const AddTodoTile(),
                  ],
                )),
              ),
            );
          }),
    );
  }
}
