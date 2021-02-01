import 'package:flutter/material.dart';

class NominalPulsa extends StatefulWidget {
  const NominalPulsa({
    Key key,
    this.onChanged,
  }) : super(key: key);

  final Function(double) onChanged;

  @override
  _NominalPulsaState createState() => _NominalPulsaState();
}

class _NominalPulsaState extends State<NominalPulsa> {
  double selectedValue = 20000;
  List<double> _boxPulsa = [20000, 25000, 30000];

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
                  child: Text(element.toString()),
                  value: element,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  widget.onChanged(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
