import 'dart:convert';

import 'package:http/http.dart';

class PokemonApi {
  final String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  getPokemon() async {
    try {
      Response response = await get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      var list = jsonDecode(response.body);
      return list;
    }
    catch (error) {
      print(error);
    }
  }
}