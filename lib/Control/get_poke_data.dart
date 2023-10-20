import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokedex/Model/poke_card_model.dart';

Future<List<PokeCardModel>?> getAllPokemons() async {
  List<PokeCardModel>? pokeCardModels;
  var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20'));

  if(response.statusCode == 200){
    pokeCardModels = (json.decode(response.body)['results'] as List).map((card) => PokeCardModel.fromJSON(card)).toList();
    // print(pokeCardModels);
    return pokeCardModels;
  }
  return null;
}

Future<PokeCardModel?> getPokeData(PokeCardModel pokemon) async {
  var response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemon.name}'));

  if(response.statusCode == 200){
    var data = json.decode(response.body);
    pokemon.avatar = (data['sprites']['other']['dream_world']['front_default']);
    pokemon.type = (data['types'][0]['type']['name']);
    return pokemon;
  }

  return null;

}