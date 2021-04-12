import 'package:auto_route/auto_route_annotations.dart';
import 'package:todo_list/presentation/auth/sign_in_page.dart';
import 'package:todo_list/presentation/notes/note_form_page.dart';
import 'package:todo_list/presentation/notes/notes_over_view/notes_overview_page.dart';
import 'package:todo_list/presentation/splash/splash_page.dart';
@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
    MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
  ],
)
class $Router{}