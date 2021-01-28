import 'package:flutter/material.dart';

class CardCashback extends StatefulWidget {
  const CardCashback({
    Key key,
  }) : super(key: key);

  @override
  _CardCashbackState createState() => _CardCashbackState();
}

class _CardCashbackState extends State<CardCashback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
            child: Text(
              'Cashback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Pemilik Retail"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Badan Koperasi"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Koperasi"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Retail"), new Text("Rp5800")]),
          ),
        ],
      ),
    );
  }
}
