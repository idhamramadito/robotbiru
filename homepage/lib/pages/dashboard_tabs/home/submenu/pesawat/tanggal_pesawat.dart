import 'package:flutter/material.dart';

class TanggalPesawat extends StatefulWidget {
  @override
  _TanggalPesawatState createState() => _TanggalPesawatState();
}

class _TanggalPesawatState extends State<TanggalPesawat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Jakarta > Denpasar-Bali',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
