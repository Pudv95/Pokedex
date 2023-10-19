import 'package:flutter/material.dart';
import 'package:pokedex/Screen/MyPokedex.dart';

void main(){
  return runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: MyPokedex(),
  ));
}