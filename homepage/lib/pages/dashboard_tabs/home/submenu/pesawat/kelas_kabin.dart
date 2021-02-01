import 'package:flutter/material.dart';

class KelasKabin extends StatefulWidget {
  @override
  _KelasKabinState createState() => _KelasKabinState();
}

class _KelasKabinState extends State<KelasKabin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              'Kelas Kabin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              'Ekonomi',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            child: Text(
              'Premium Ekonomi',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            child: Text(
              'Bisnis',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            child: Text(
              'First',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
