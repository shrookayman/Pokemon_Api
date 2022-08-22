import 'package:flutter/material.dart';
import 'package:pokemon_api/model/pokemon_info.dart';
import 'package:pokemon_api/pokemon.dart';



class PokemonCard extends StatefulWidget {
  late SmallPokemonCard smallPokemonCard;
  final int index;
 final dynamic data;


  PokemonCard( this.index, this.data){
    smallPokemonCard = SmallPokemonCard(data['name'], data['img']);
  }


  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0,top:5,left: 11,right: 11),
      child: Container(
       height: 170,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            )
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PokemonInfo(widget.index,widget.data))
                  );
                });
              },
              child:
               Image(image: NetworkImage(widget.smallPokemonCard.img)),

            ),
             Text(
              widget.smallPokemonCard.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),

          ],
        ),

      ),
    );
  }
}
