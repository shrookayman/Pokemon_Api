import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon.dart';

import '../model/pokemon_card.dart';
import '../pokemon_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   late PokemonApi _pokemonApi ;
   late Stream _stream;
   late StreamController _streamController;
   var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override

  void initState(){
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
    _pokemonApi =PokemonApi();
    getPokemon();
  }
   getPokemon() async{
    var response = await _pokemonApi.getPokemon();
    _streamController.add(response);
   }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Center(
          child: Text('Poke App',),
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream:_stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasData){
              var data = snapshot.data as Map;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    childAspectRatio: 1/1,
                  ),
                  itemBuilder: (context,i)=>PokemonCard(i,data['pokemon'][i]),
                  itemCount: data['pokemon'].length
              );
            }
            else{
              return CircularProgressIndicator();
            }
          },

        ),
      ),
    );
  }
}
