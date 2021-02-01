import 'package:flutter/material.dart';

class PilihKeberangkatan extends StatefulWidget {
  @override
  _PilihKeberangkatanState createState() => _PilihKeberangkatanState();
}

class _PilihKeberangkatanState extends State<PilihKeberangkatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pilih Keberangkatan',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 25),
                    hintText: 'Cari Kota atau Bandara'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
