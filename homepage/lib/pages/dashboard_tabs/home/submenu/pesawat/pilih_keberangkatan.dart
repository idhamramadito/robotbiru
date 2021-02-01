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
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(30, 10, 20, 0),
            child: Text(
              'Tujuan Terpopuler',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: ListTile(
              dense: true,
              leading: Image.asset("images/gedung.png", width: 40),
              title: Text(
                'Jakarta, Indonesia',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Semua Bandara',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'JKTC',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
