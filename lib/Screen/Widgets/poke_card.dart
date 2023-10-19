import 'package:flutter/material.dart';
import '../../Model/poke_card_model.dart';

class PokeCard extends StatelessWidget {
  final PokeCardModel pokeCardModel;

  const PokeCard({Key? key, required this.pokeCardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 175,
      child:  Card(
        elevation: 3,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Column(
              children: [
                Text(pokeCardModel.name??"pikachu"),
                Text(pokeCardModel.type ?? "ground"),
              ],
            ),
            Image(image: NetworkImage(pokeCardModel.avatar ?? ""))
          ],
        ),
      ),
    );
  }
}