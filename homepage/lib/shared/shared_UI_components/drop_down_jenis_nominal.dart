import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';

class DropDownJenisNominal extends StatefulWidget {
  const DropDownJenisNominal({
    Key key,
    @required this.prevData,
    @required this.onChanged,
    @required this.nominalList,
  }) : super(key: key);

  final TopUpModel prevData;
  final Function(NameAndContent) onChanged;
  final List<NameAndContent> nominalList;

  @override
  _NominalPulsaState createState() => _NominalPulsaState();
}

class _NominalPulsaState extends State<DropDownJenisNominal> {
  double selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Jenis Nominal ${widget.prevData.transactionType}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        DropdownButton(
          hint: Text("Pilih Jenis Nominal ${widget.prevData.transactionType}"),
          itemHeight: 80,
          isExpanded: true,
          iconEnabledColor: Theme.of(context).primaryColor,
          value: selectedValue,
          items: widget.nominalList.map((element) {
            return DropdownMenuItem(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(
                    '${element.name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        '${element.content}',
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
      ],
    );
  }
}
