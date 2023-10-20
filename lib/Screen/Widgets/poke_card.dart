import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/Screen/MyPokedex.dart';
import '../../Model/poke_card_model.dart';

class PokeCard extends StatelessWidget {
  final PokeCardModel pokeCardModel;
  PokeCard({Key? key, required this.pokeCardModel}) : super(key: key);

  final List<Widget> centerWidgets = [MyPokedex(),Center()];
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 175,
      child:  Card(
        elevation: 3,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SvgPicture.network(pokeCardModel.avatar ?? "Nahi_hai_image",height: 80,width: 80,),
            Text(pokeCardModel.name??"pikachu"),
            Text(pokeCardModel.type ??"hum pe to hai no")
          ],
        ),
      ),
    );
  }
}


