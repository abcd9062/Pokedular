import 'package:go_router/go_router.dart';
import 'package:poke_multimodular_demo/home_screen_1.dart';
import 'package:pokedex/core/routes/pokedex_route.dart';
import 'package:pokenote/core/route/pokenote_route.dart';

// GoRouter configuration
final pokeDularRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        name: 'mainscreen', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: '/',
        builder: (context, state) => HomeScreen1(),
        routes: <RouteBase>[
         PokeDexRoute.getPokeDexRoute('/pokelist'),
         PokeNoteRoute.getPokeNoteRoute('/pokenote')
        ]
    ),
  ],
);