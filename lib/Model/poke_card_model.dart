import 'package:flutter/material.dart';

class PokeCardModel{
  String? name;
  String? type;
  String? avatar;

  PokeCardModel({required this.name,required this.avatar,required this.type});

  factory PokeCardModel.fromJSON(Map<String,dynamic> model) {
    return PokeCardModel(
        name: model['name'], type: '', avatar: '');
  }
}