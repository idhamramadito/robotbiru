import 'package:flutter/material.dart';

class ScanBarcode extends StatefulWidget {
  @override
  _ScanBarcodeState createState() => new _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Scan'),
                onPressed: () async {},
              ),
              Text(
                'Result: $barcode',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
