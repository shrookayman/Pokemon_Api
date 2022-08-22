import 'package:flutter/material.dart';
import 'package:pokemon_api/model/my_text.dart';

import '../pokemon.dart';

class PokemonInfo extends StatelessWidget {
  late final int index;
  final dynamic data;
  late Pokemon _pokemon;


  PokemonInfo(this.index, this.data, {Key? key}) : super(key: key) {

    _pokemon = Pokemon(data['id'],data['num'], data['name'], data['img'], data['type'],
        data['height'], data['weight'], data['weaknesses'],data['candy']

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[100],
        title: Text(_pokemon.name,style: TextStyle(fontSize: 25),),
        elevation: 0,

      ),
      backgroundColor: Colors.blueAccent[100],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width:300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image(
                    image: NetworkImage (_pokemon.img),
                  ),
                  Column(
                    children: [
                      Text(
                        _pokemon.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 10,),
                      MyText('type: ${_pokemon.type[_pokemon.id-1]}'),
                      MyText('height: ${_pokemon.height}'),
                      MyText('weight: ${_pokemon.weight}'),
                      MyText('weaknesses: ${_pokemon.weaknesses[_pokemon.id-1]}'),
                      MyText('candy: ${_pokemon.candy}'),


                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}