import 'package:go_router/go_router.dart';
import 'package:pokenote/ui/screen/pokenote_screen.dart';

// GoRouter configuration
final pokeNoteRouter = GoRouter(
  initialLocation: '/',
  routes: [
    PokeNoteRoute.getPokeNoteRoute('/')
  ],
);

class PokeNoteRoute {
  PokeNoteRoute._();
  static GoRoute getPokeNoteRoute(String initialPath) {
    return GoRoute(
        name: 'pokenote', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: initialPath,
        builder: (context, state) => PokenoteScreen()
    );
  }
}