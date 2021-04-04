import 'package:flutter/material.dart';
import 'package:todo_list/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key key, @required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '😱',
            style: const TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
                insufficientPermission: (_) => 'Insufficient permission',
                orElse: () => 'Unexpected error. \n Please contact support,'),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          FlatButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.mail),
                SizedBox(width: 4,),
                Text('I NEED HELP'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
