import 'package:flutter/material.dart';

class Pemesanan extends StatefulWidget {
  Pemesanan({
    Key key,
  }) : super(key: key);

  @override
  _PemesananState createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Form Pemesanan'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15, right: 200),
        child: Column(
          children: [
            Text(
              'Detail Penerbangan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
