import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_list/domain/notes/value_objects.dart';

class ColorField extends StatelessWidget {
  const ColorField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (p, c) => p.note.color != c.note.color,
      builder: (context, state) {
        return Container(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () => context
                    .read<NoteFormBloc>()
                    .add(NoteFormEvent.colorChanged(itemColor)),
                child: Material(
                  color: itemColor,
                  elevation: 4.0,
                  shape: CircleBorder(
                    side: state.note.color.value.fold(
                        (_) => BorderSide.none,
                        (color) => color == itemColor
                            ? BorderSide(
                                width: 1.5,
                              )
                            : BorderSide.none),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
            itemCount: NoteColor.predefinedColors.length,
          ),
        );
      },
    );
  }
}
