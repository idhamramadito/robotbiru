import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';

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
  List<NameAndContent> _pulsa = [
    NameAndContent(name: '20000.0', content: 19500),
    NameAndContent(name: '25000.0', content: 24500),
    NameAndContent(name: '30000.0', content: 29500),
  ];
  List<NameAndContent> _paketData = [
    NameAndContent(
        name: '[IY1] IDY1 - Indosat Data Yellow 1 GB, 1 Hari', content: 4975),
    NameAndContent(
        name: '[IY3] IDY3 - Indosat Data Yellow 1 GB, 3 Hari', content: 6475),
    NameAndContent(name: '[MI30] Indosat Data 300 mb 30 Hari', content: 6875),
  ];
  List<NameAndContent> _ovo = [
    NameAndContent(name: '[GR20] OVO20 - OVO Saldo 20rb', content: 21390),
    NameAndContent(name: '[GR25] OVO25 - OVO Saldo 25rb', content: 26390),
    NameAndContent(name: '[GR25] OVO50 - OVO Saldo 50rb', content: 51390),
  ];
  List<NameAndContent> _gopay = [
    NameAndContent(name: '[GP10] GoPay Costumer 10.000', content: 11425),
    NameAndContent(name: '[GP20] GoPay Costumer 20.000', content: 21425),
    NameAndContent(name: '[GP25] GoPay Costumer 25.000', content: 21700),
  ];
  List<NameAndContent> _linkAja = [
    NameAndContent(name: '[CH10] LinkAja 10k', content: 11325),
    NameAndContent(name: '[CH20] LinkAja 20k', content: 21325),
    NameAndContent(name: '[CH25] LinkAja 25k', content: 26325),
  ];
  List<NameAndContent> _dana = [
    NameAndContent(name: '[DN10] Saldo Dana 10.000', content: 11265),
    NameAndContent(name: '[DN20] Saldo Dana 20.000', content: 21265),
    NameAndContent(name: '[DN25] Saldo Dana 25.000', content: 26265),
  ];
  List<NameAndContent> _shopee = [
    NameAndContent(name: '[SP10] ShopeePay 10k', content: 11355),
    NameAndContent(name: '[SP10] ShopeePay 20k', content: 21355),
    NameAndContent(name: '[SP10] ShopeePay 30k', content: 31355),
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
            child: DropdownButton(
              itemHeight: 80,
              isExpanded: true,
              iconEnabledColor: Theme.of(context).primaryColor,
              value: selectedValue,
              items: _boxPulsa.map((element) {
                return DropdownMenuItem(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        '$element',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
