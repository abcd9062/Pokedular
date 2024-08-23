import 'package:dio/dio.dart';

import '../models/pokemon_response.dart';

class PokeRemoteDatasource {
  Future<PokemonResponse> getPokeMonList() async {
    final dio = Dio();
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon?limit=50');
    return PokemonResponse.fromJson(response.data);
  }
}