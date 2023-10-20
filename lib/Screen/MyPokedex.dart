import 'package:flutter/material.dart';
import 'package:pokedex/Control/get_poke_data.dart';
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
            future: getAllPokemons(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              List<PokeCardModel> pokeCards= snapshot.data;
              return GridView.builder(
                itemCount: pokeCards.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
                  itemBuilder: (_, index){
                    return FutureBuilder(
                      future: getPokeData(pokeCards[index]),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          PokeCardModel pokeCardModel = snapshot.data;
                          print(pokeCardModel.avatar);
                          return PokeCard(pokeCardModel: pokeCardModel);
                        }
                        else{
                          return const CircularProgressIndicator();
                        }
                    },);
                  });
            }else{
              return  Center(child: ElevatedButton(onPressed: (){getAllPokemons();}, child: const Text('test')));
            }
          },),
      ),
    );
  }
}
