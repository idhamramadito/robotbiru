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
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _cashback.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(_cashback[index][0]),
                        new Text(_cashback[index][1]),
                      ]),
                );
              }),
        ],
      ),
    );
  }
}

List _cashback = [
  ['Pemilik Retail', 'Rp5800'],
  ['Badan Koperasi', 'Rp5800'],
  ['Anggota Koperasi', 'Rp5800'],
  ['Anggota Retail', 'Rp5800'],
];
