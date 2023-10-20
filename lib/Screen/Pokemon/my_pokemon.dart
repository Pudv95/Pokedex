import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPokemon extends StatefulWidget {
  final String pokePic;
  const MyPokemon({super.key,required this.pokePic});

  @override
  State<MyPokemon> createState() => _MyPokemonState();
}

class _MyPokemonState extends State<MyPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'pokePic',
          child: SvgPicture.network(widget.pokePic,height: 80,width: 80,),
        ),
      ),
    );
  }
}
