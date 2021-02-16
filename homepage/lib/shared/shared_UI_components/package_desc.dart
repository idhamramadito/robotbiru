import 'package:flutter/material.dart';
import 'package:homepage/models/topup_model.dart';

class PackageDesc extends StatefulWidget {
  const PackageDesc({
    Key key,
    this.data,
  }) : super(key: key);
  final TopUpModel data;

  @override
  _PackageDescState createState() => _PackageDescState();
}

class _PackageDescState extends State<PackageDesc> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('${widget.data.chosenPackage.logoPath}'),
      title: Text(
        "${widget.data.chosenPackage.name}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
