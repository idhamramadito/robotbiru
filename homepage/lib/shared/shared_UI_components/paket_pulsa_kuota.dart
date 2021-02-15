import 'package:flutter/material.dart';
import 'package:homepage/models/topup_model.dart';

class PaketPulsaKuota extends StatefulWidget {
  const PaketPulsaKuota({
    Key key,
    this.data,
  }) : super(key: key);
  final TopUpModel data;

  @override
  _PaketPulsaKuotaState createState() => _PaketPulsaKuotaState();
}

class _PaketPulsaKuotaState extends State<PaketPulsaKuota> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("images/provider_indosat.png"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 1, 0, 1),
              child: Text(
                "${widget.data.chosenPackage.name}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text("Masa Aktif 40 Hari"),
            ),
          ],
        )
      ],
    );
  }
}
