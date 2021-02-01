import 'package:flutter/material.dart';

class TransportationAttributes {
  String name;
  IconData icon;
  String content;
  String routeName;
  TransportationAttributes({
    String name,
    IconData icon,
    String content,
    String routeName,
  })  : this.name = name,
        this.icon = icon,
        this.content = content,
        this.routeName = routeName;
}
