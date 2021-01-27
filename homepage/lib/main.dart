import 'package:flutter/material.dart';
import 'package:homepage/routing/routing_table.dart';

void main() {
  runApp(RobotBiruApp());
}

class RobotBiruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Robot Biru',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff008AD5), //Colors.blue[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RoutingTable.generateRoute,
    );
  }
}
