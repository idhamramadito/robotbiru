import 'package:flutter/material.dart';

class TransportationAttributes {
  String id;
  String name;
  IconData icon;
  var content;
  Function onPressed;
  TransportationAttributes({
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
