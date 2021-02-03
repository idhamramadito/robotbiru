import 'package:flutter/material.dart';

class KebijakanPembatalan extends StatefulWidget {
  @override
  _KebijakanPembatalanState createState() => _KebijakanPembatalanState();
}

class _KebijakanPembatalanState extends State<KebijakanPembatalan> {
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
          ],
        ),
      ),
    );
  }
}
