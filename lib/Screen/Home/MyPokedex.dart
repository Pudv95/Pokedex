import 'package:flutter/material.dart';
import 'package:pokedex/Control/get_poke_data.dart';
import 'package:pokedex/Model/poke_card_model.dart';
import 'Widgets/poke_card.dart';

class MyPokedex extends StatefulWidget {
  const MyPokedex({super.key});

  @override
  State<MyPokedex> createState() => _MyPokedexState();
}


class _MyPokedexState extends State<MyPokedex> {

  List<PokeCardModel> pokeCards = [];
  int currIndex = 0;
  final ScrollController _scrollController = ScrollController();
  double currPosition = 0;

  void _listenScrolls()async{
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      currPosition = _scrollController.position.pixels;
      currIndex+=10;
      getAllPokemons(pokeCards,currIndex);
      setState(() {});
    }

  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenScrolls);
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_scrollController.hasClients) {
      _scrollController.jumpTo(currPosition);
    }
    return  Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Background.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: getAllPokemons(pokeCards,currIndex),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                pokeCards = snapshot.data;
              return GridView.builder(
                controller: _scrollController,
                itemCount: pokeCards.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
                  itemBuilder: (_, index){
                    return FutureBuilder(
                      future: getPokeData(pokeCards[index]),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          PokeCardModel pokeCardModel = snapshot.data;
                          return PokeCard(pokeCardModel: pokeCardModel);
                        }
                        else if(snapshot.hasError){
                            return PokeCard(pokeCardModel: pokeCards[index]);
                        }
                        else{
                          return const CircularProgressIndicator();
                        }
                    },);
                  });
            }else{
              return  const Center(child: CircularProgressIndicator(),);
            }
          },),
      ),
    );
  }
}
