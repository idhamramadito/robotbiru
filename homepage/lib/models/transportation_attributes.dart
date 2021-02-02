import 'package:flutter/material.dart';

class TransportationAttributes {
  String name;
  IconData icon;
  var content;
  String routeName;
  Function onPressed;
  TransportationAttributes({
    String name,
    IconData icon,
    var content,
    String routeName,
    Function onPressed,
  })  : this.name = name,
        this.icon = icon,
        this.content = content,
        this.routeName = routeName,
        this.onPressed = onPressed;
}
