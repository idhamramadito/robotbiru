import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class HargaDetail extends StatefulWidget {
  @override
  _HargaDetailState createState() => _HargaDetailState();
}

class _HargaDetailState extends State<HargaDetail> {
  List<NameAndContent> _bonusList = [
    NameAndContent(name: 'Cashback'),
    NameAndContent(name: 'Anggota'),
    NameAndContent(name: 'Retail'),
  ];

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Pergi',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Pulang',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Jakarta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.sync_alt),
                  SizedBox(width: 10),
                  Text(
                    'Denpasar - Bali',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Tarif',
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${String.fromCharCode(0x2022)}  Dewasa (1x)'),
                  Text('Rp 435.454')
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${String.fromCharCode(0x2022)}  Anak (1x)'),
                  Text('Rp 435.454')
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Fasilitas Ekstra',
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${String.fromCharCode(0x2022)}  Bagasi (20Kg)'),
                  Text('Rp 533.865')
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Biaya Lainnya',
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${String.fromCharCode(0x2022)}  Biaya Layanan Penumpang '),
                  Text('GRATIS')
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${String.fromCharCode(0x2022)}  Pajak'),
                  Text('Termasuk')
                ],
              ),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    'Rp 565.454',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Divider(),
              SizedBox(height: 15),
              ReceiptCard(title: 'Bonus', dataList: _bonusList),
            ],
          ),
        ),
      ),
    );
  }
}
