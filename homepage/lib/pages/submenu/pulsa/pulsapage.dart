import 'package:flutter/material.dart';

class PulsaPage extends StatefulWidget {
  PulsaPage({Key key}) : super(key: key);

  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[600], title: Text('Pulsa')),
    );
  }
}
