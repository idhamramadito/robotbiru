import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNoMeteran extends StatefulWidget {
  const FormNoMeteran({
    Key key,
  }) : super(key: key);

  @override
  _FormNoMeteranState createState() => _FormNoMeteranState();
}

class _FormNoMeteranState extends State<FormNoMeteran> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Masukkan ID Pelanggan / Nomor Meteran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.clear, size: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "ID Pelanggan / Nomor Meteran",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.qr_code_scanner),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/scan_barcode');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}