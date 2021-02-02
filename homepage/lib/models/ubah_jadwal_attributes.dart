import 'package:flutter/material.dart';

class UbahJadwalAttribute {
  String id;
  String name;
  IconData icon;
  var content;
  String routeName;
  UbahJadwalAttribute({
    String id,
    String name,
    IconData icon,
    var content,
    String routeName,
  })  : this.id = id,
        this.name = name,
        this.icon = icon,
        this.content = content,
        this.routeName = routeName;
}
