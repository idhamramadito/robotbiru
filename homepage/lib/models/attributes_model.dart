import 'package:flutter/material.dart';

class AttributesModel {
  String id;
  String name;
  IconData icon;
  var content;
  Function onPressed;
  AttributesModel({
    String id,
    String name,
    IconData icon,
    var content,
    String routeName,
    Function onPressed,
  })  : this.id = id,
        this.name = name,
        this.icon = icon,
        this.content = content,
        this.onPressed = onPressed;
}
