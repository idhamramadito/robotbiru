import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class InvoicePulsa extends StatelessWidget {
  final List<NameAndContent> _boxDetailPesanan = [
    NameAndContent(name: 'Ditransfer Menggunakan'),
    NameAndContent(name: 'Status'),
    NameAndContent(name: 'Waktu'),
    NameAndContent(name: 'Tanggal'),
    NameAndContent(name: 'ID Transfer'),
    NameAndContent(name: 'Jumlah Transfer'),
    NameAndContent(name: 'Biaya Admin'),
    NameAndContent(name: 'Total Transfer'),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.clear_rounded, color: Colors.grey),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              })
        ],
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
                child: Column(
              children: [
                Container(
                  child: Image.asset('images/logo_biru.png'),
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '25 Agustus 2020 11.30 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'ID: 594T954TY65',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('images/ceklis_small.png'),
                      Text(
                        '  Transaksi Berhasil',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'RP20.300',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Metode Pembayaran',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        'Saldo Robot Biru',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Produk",
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Container(
                          child: Image.asset('images/indosat_kecil.png'),
                        )
                      ]),
                ),
                ReceiptCard(dataList: _boxDetailPesanan),
                SizedBox(height: 10),
                Container(
                  child: Image.asset('images/barcode.png'),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
  //============================= main function ===============================
}
