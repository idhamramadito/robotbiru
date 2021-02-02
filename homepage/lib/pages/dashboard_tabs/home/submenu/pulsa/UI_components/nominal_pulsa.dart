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
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Theme.of(context).primaryColor,
              value: selectedValue,
              items: _boxPulsa.map((element) {
                return DropdownMenuItem(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$element',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                          children: [
                            Text(
                              'Harga',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              '${element - 500}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700]),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
