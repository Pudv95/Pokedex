import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPokemon extends StatelessWidget {
  final String pokePic;
  const MyPokemon({super.key,required this.pokePic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Hero(tag:'pokePic',child: SvgPicture.network(pokePic,height: 280,width: 280,)),
      ),
    );
  }
}
