import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/Screen/Pokemon/my_pokemon.dart';
import '../../../Model/poke_card_model.dart';

class PokeCard extends StatelessWidget {
  final PokeCardModel pokeCardModel;
  const PokeCard({Key? key, required this.pokeCardModel}) : super(key: key);

  final int index = 0;

  _getColor(String? type){
    switch(type){
      case "grass":
        return Colors.green[500];
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "normal":
        return Colors.purpleAccent;
      default:
        return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 175,
      child: InkWell(
        onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPokemon(pokePic: pokeCardModel.avatar??"")));
        },
        child: Card(
          color: _getColor(pokeCardModel.type),
          elevation: 3,
          shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag:'pokePic',child: SvgPicture.network(pokeCardModel.avatar ?? "Nahi_hai_image",height: 80,width: 80,)),
              const SizedBox(height: 30,),
              Text(pokeCardModel.name?.toUpperCase() ?? "pika_pika",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,letterSpacing: 1.5),),
              Text('Type : ${pokeCardModel.type?.toUpperCase()}',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }
}


