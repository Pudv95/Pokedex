import 'package:flutter/material.dart';
import 'package:pokedex/Screen/Home/MyPokedex.dart';

void main(){
  return runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: MyPokedex(),
  ));
}