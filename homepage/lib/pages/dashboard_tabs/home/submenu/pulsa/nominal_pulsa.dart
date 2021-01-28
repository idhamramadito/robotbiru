import 'package:flutter/material.dart';

class NominalPulsa extends StatefulWidget {
  @override
  _NominalPulsaState createState() => _NominalPulsaState();
}

class _NominalPulsaState extends State<NominalPulsa> {
  List boxAtas = [
    ['20.000', 'Harga', 'Rp19.500'],
    ['25.000', 'Harga', 'Rp24.500'],
    ['30.000', 'Harga', 'Rp29.000']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nominal Pulsa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        boxAtas[index][0],
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        boxAtas[index][1],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        boxAtas[index][2],
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700]),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
