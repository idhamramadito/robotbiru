import 'package:flutter/material.dart';

class TransPulsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Ditransfer Menggunakan",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("Saldo Robot Biru")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Status",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("Diproses")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Waktu",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("11:30 PM")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Tanggal",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("25 Januari 2021")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "ID Transfer",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("ID23423232")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Jumlah Transfer",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("Rp 10.000")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(
                  "Biaya Admin",
                  style: TextStyle(color: Colors.grey),
                ),
                new Text("Rp 1.000")
              ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text("Total Transfer",
                    style: TextStyle(color: Colors.grey)),
                new Text("Rp 11.000")
              ]),
        ),
        SizedBox(height: 10),
        Container(
          child: Image.asset('images/barcode.png'),
        ),
      ],
    ));
  }
}
