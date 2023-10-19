import 'package:flutter/material.dart';
import 'package:pokedex/Model/poke_card_model.dart';
import 'package:pokedex/Screen/Widgets/poke_card.dart';

class MyPokedex extends StatefulWidget {
  MyPokedex({super.key});

  @override
  State<MyPokedex> createState() => _MyPokedexState();
}

class _MyPokedexState extends State<MyPokedex> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Background.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
                  itemBuilder: (_, index){
                    return const Placeholder();
                  });
            }else{
              return const CircularProgressIndicator();
            }
          },),
      ),
    );
  }
}
