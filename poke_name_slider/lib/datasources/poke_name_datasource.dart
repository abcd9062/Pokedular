import 'package:dio/dio.dart';

import '../models/pokename_response.dart';

class PokeNameRemoteDatasource {
  Future<PokeNameResponse> getPokeMonList() async {
    final dio = Dio();
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon?limit=50');
    return PokeNameResponse.fromJson(response.data);
  }
}