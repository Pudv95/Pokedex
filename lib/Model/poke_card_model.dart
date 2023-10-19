import 'package:flutter/material.dart';

class PokeCardModel{
  String? name;
  String? type;
  String? avatar;

  PokeCardModel({required this.name,required this.avatar,required this.type});

  PokeCardModel.fromMap(Map<String,dynamic> model):name = model['name'],type = model['type'],avatar = model['avatar'];

}