import 'package:flutter/material.dart';

class KebijakanPemesanan extends StatefulWidget {
  @override
  _KebijakanPemesananState createState() => _KebijakanPemesananState();
}

class _KebijakanPemesananState extends State<KebijakanPemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Pembatalan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              leading: Image.asset('images/japan_airlines.png'),
              title: Text(
                'Japan Airlines',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                'JT-22',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            ListTile(
              dense: true,
              leading: Text(String.fromCharCode(0x2022)),
              title: Text(
                  'Pembatalan yang dilakukan di atas 72 jam sebelum keberangkatan dikenakan biaya sebesar 25% dari harga tiket'),
            ),
            SizedBox(height: 10),
            ListTile(
              dense: true,
              leading: Text(String.fromCharCode(0x2022)),
              title: Text(
                  'Pembatalan yang dilakukan antara 72 jam - 4 jam sebelum keberangkatan dikenakan biaya 50% dari harga tiket'),
            ),
            SizedBox(height: 10),
            ListTile(
              dense: true,
              leading: Text(String.fromCharCode(0x2022)),
              title: Text(
                  'Pembatalan yang dilakkukan hingga 4 jam sebelum keberangkatan dikenakan biaya sebesar 90% dari harga tiket'),
            )
          ],
        ),
      ),
    );
  }
}
