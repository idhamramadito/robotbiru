import 'package:flutter/material.dart';

class TransListrik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 30),
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
        Container(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('20rb 45464564 Danu Nur H',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
                  child: Container(
                      width: 52,
                      height: 27,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Listrik",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
              child: Container(
                  width: 110,
                  height: 27,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(
                      color: Colors.green, //
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Order Berhasil",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                  )),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Nomor Token",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 342,
                  height: 50,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(
                      color: Colors.blue, //
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      child: Text(
                        "1234 5678 9101 1213 11111",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Jumlah kWH: 12,5",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Container(
              width: 1000,
              height: 50,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(0),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Text(
                            "Total Pembayaran",
                            style: TextStyle(
                                fontSize: 17,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                          child: Text(
                            "Rp20.300",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  "Detail Pesanan",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "IDPEL",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("131241412412414")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Nama",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("Miyamori Aoi")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Tarif/Daya",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("R1M/900VA")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Waktu",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("1:30 PM")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Tanggal",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("25 Agustus 2020")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Stand Meter",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("0103901390193-1203910392190")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "RP TAG PLN",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("Rp2900.200")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "NO REF",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("OBMS 4345 X 4454 545")
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  "Detail Transaksi",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Admin",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("Rp1.555")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Cashback",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("Rp755")
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Total Bayar",
                            style: TextStyle(color: Colors.grey),
                          ),
                          new Text("Rp173.555")
                        ]),
                  ),
                  SizedBox(height: 90),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
