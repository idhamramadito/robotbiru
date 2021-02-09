import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/choice_bottom_sheet.dart';

import 'UI_components/pilih_bagasi.dart';

class Bagasi extends StatefulWidget {
  final TransportationModel datasebelum;

  const Bagasi({
    Key key,
    this.datasebelum,
  }) : super(key: key);
  @override
  _BagasiState createState() => _BagasiState();
}

class _BagasiState extends State<Bagasi> {
  List<String> luggageSize = ["0kg", "0kg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bagasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Penumpang',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Tuan Anbiya Nur Rohmat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pergi: ${luggageSize[0] ?? "0kg"}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Visibility(
                      visible: widget.datasebelum.isTwoWayTrip,
                      child: Text(
                        'Pulang: ${luggageSize[1] ?? "0kg"}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Penerbangan Pergi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              PilihBagasi(
                number: luggageSize[0],
                onTap: () async {
                  final String result =
                      await choiceBottomSheet(context, 'Bagasi');
                  setState(() {
                    luggageSize[0] = result ?? luggageSize[0];
                  });
                },
              ),
              Visibility(
                  visible: widget.datasebelum.isTwoWayTrip,
                  child: Column(
                    children: [
                      Text(
                        'Penerbangan Pulang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      PilihBagasi(
                        number: luggageSize[1],
                        onTap: () async {
                          final String result =
                              await choiceBottomSheet(context, 'Bagasi');
                          setState(() {
                            luggageSize[1] = result ?? luggageSize[1];
                          });
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      'Rp 307.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: BigButton(
                title: 'Simpan',
                onPressed: () => Navigator.pop(context, luggageSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
