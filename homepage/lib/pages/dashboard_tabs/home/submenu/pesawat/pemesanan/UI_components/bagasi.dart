import 'package:flutter/material.dart';

class Bagasi extends StatefulWidget {
  @override
  _BagasiState createState() => _BagasiState();
}

class _BagasiState extends State<Bagasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bagasi'),
      ),
      body: Column(
        children: [
          Text(
            'Penumpang',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.symmetric(),
            padding: EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Text(
                  '1. Tuan Anbiya Nur Rohmat',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Pergi: 0Kg')
              ],
            ),
          ),
          Text('Penerbangan Pergi',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            margin: EdgeInsets.symmetric(),
            padding: EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('/japan-airlines.png'),
                    Text('CGK - DPS')
                  ],
                ),
                Text('Kamu punya bagasi gratis 20kg'),
                Text('Bagasi Pergi Tambahan'),
                Container(
                  margin: EdgeInsets.symmetric(),
                  padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0 Kg (+RP 0)',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
                Text(
                    'Untuk keberangkatan kurang dari 6 jam, Anda dapat membeli bagasi di bandara.')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
