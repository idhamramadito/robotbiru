import 'package:flutter/material.dart';

class NominalPulsa extends StatefulWidget {
  const NominalPulsa({
    Key key,
  }) : super(key: key);

  @override
  _NominalPulsaState createState() => _NominalPulsaState();
}

class _NominalPulsaState extends State<NominalPulsa> {
  String selectedValue = '20.000';
  List _boxPulsa = [
    ['20.000', 'Harga', 'Rp19.500'],
    ['25.000', 'Harga', 'Rp24.500'],
    ['30.000', 'Harga', 'Rp29.000']
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Nominal Pulsa",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DropdownButtonFormField(
              iconEnabledColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedValue,
              items: _boxPulsa.map((element) {
                return DropdownMenuItem(
                  child: Text(element[0]),
                  value: element[0],
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
