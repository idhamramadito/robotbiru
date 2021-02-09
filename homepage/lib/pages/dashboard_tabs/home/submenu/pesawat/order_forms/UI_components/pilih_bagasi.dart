import 'package:flutter/material.dart';

class PilihBagasi extends StatefulWidget {
  const PilihBagasi({
    Key key,
    @required this.number,
    @required this.onTap,
  }) : super(key: key);

  final String number;
  final Function onTap;

  @override
  _PilihBagasiState createState() => _PilihBagasiState();
}

class _PilihBagasiState extends State<PilihBagasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'images/japan-airlines.png',
                width: 50,
              ),
              Text(
                'CGK - DPS',
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Kamu punya bagasi gratis 20kg'),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Bagasi Pergi Tambahan',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              dense: true,
              onTap: widget.onTap,
              title: Text(
                widget.number ?? "0kg",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down,
                size: 20.0,
                color: Colors.brown[900],
              ),
            ),
          ),
          Text(
            'Untuk keberangkatan kurang dari 6 jam, Anda dapat membeli bagasi di bandara.',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
