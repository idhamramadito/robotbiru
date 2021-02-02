import 'package:flutter/material.dart';

class TransportationAttributes {
  String name;
  IconData icon;
  String content;
  Function onPressed;
  TransportationAttributes({
    String name,
    IconData icon,
    String content,
    Function onPressed,
  })  : this.name = name,
        this.icon = icon,
        this.content = content,
        this.onPressed = onPressed;
}
