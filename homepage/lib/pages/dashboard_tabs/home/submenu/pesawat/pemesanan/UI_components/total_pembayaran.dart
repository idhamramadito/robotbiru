import 'package:flutter/material.dart';

class TotalPembayaran extends StatefulWidget {
  @override
  _TotalPembayaranState createState() => _TotalPembayaranState();
}

class _TotalPembayaranState extends State<TotalPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Harga Detail'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    child: Text(
                      'Pergi',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    child: Text(
                      'Pulang',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Jakarta',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.sync_alt),
                  Text(
                    'Denpasar - Bali',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Tarif',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
