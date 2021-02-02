import 'package:flutter/material.dart';

class UbahJadwalAttribute {
  String name;
  IconData icon;
  var content;
  String routeName;
  UbahJadwalAttribute({
    String name,
    IconData icon,
    var content,
    String routeName,
  })  : this.name = name,
        this.icon = icon,
        this.content = content,
        this.routeName = routeName;
}
