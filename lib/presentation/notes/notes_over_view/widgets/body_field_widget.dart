import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_list/domain/notes/value_objects.dart';

class BodyField extends HookWidget {
  const BodyField();

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getValue();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          autovalidateMode: context.read<NoteFormBloc>().state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          controller: textEditingController,
          decoration: InputDecoration(
            counterText: '',
            labelText: 'Note',
          ),
          maxLength: NoteBody.maxLength,
          maxLines: null,
          minLines: 5,
          onChanged: (value) => context.read<NoteFormBloc>().add(
                NoteFormEvent.bodyChanged(value),
              ),
          validator: (_) =>
              context.read<NoteFormBloc>().state.note.body.value.fold(
                  (f) => f.maybeMap(
                        empty: (f) => 'Cannot be empty',
                        exceedingLength: (f) =>
                            'Exceeding length, max: ${f.max}',
                        orElse: () => null,
                      ),
                  (r) => null),
        ),
      ),
    );
  }
}
