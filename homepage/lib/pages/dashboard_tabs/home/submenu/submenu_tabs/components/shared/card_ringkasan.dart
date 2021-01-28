import 'package:flutter/material.dart';

class CardRingkasan extends StatefulWidget {
  const CardRingkasan({
    Key key,
    this.pageName,
  }) : super(key: key);
  final String pageName;

  @override
  _CardRingkasanState createState() => _CardRingkasanState();
}

class _CardRingkasanState extends State<CardRingkasan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
            child: Text(
              'Ringkasan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          (widget.pageName == 'Pulsa')
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      Image.asset("images/provider_indosat.png"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 1, 0, 1),
                            child: Text(
                              "Pulsa 30.000",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text("Masa Aktif 40 Hari"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
        ],
      ),
    );
  }
}
