import 'package:flutter/material.dart';

class PaketPulsaKuota extends StatelessWidget {
  const PaketPulsaKuota({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Row(
        children: [
          Image.asset("images/provider_indosat.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8, 1, 0, 1),
                child: Text(
                  "Pulsa 30.000",
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
      ),
    );
  }
}
