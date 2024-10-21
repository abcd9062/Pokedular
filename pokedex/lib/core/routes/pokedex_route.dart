import 'package:go_router/go_router.dart';
import 'package:pokedex/ui/poke_details_screen.dart';
import 'package:pokedex/ui/pokelist_screen.dart';

// GoRouter configuration
final pokeDexRouter = GoRouter(
  initialLocation: '/',
  routes: [
    PokeDexRoute.getPokeDexRoute('/'),
  ],
);

class PokeDexRoute {
  PokeDexRoute._();
  static GoRoute getPokeDexRoute(String initialPath) {
    return GoRoute(
        name: 'pokelist', // Optional, add name to your routes. Allows you navigate by name instead of path
        path: initialPath,
        builder: (context, state) => PokelistScreen(),
        routes: <RouteBase>[
          GoRoute(
            name: 'pokedetails',
            path: 'pokedetails/:pokeName/:pokeImgUrl',
            builder: (context, state) => PokeDetailsScreen(pokeName: state.pathParameters['pokeName'] ?? "", pokeImgUrl: state.pathParameters['pokeImgUrl'] ?? ""),
          ),
        ]
    );
  }
}
