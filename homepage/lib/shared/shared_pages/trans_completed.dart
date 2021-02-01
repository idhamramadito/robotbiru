import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class TransCompleted extends StatefulWidget {
  final String routeName;
  const TransCompleted({Key key, @required this.routeName}) : super(key: key);

  @override
  _TransCompletedState createState() => _TransCompletedState();
}

class _TransCompletedState extends State<TransCompleted> {
  final List<NameAndContent> _boxDetailTransaksi = [
    NameAndContent(name: 'Jenis Transaksi'),
    NameAndContent(name: 'Jumlah'),
    NameAndContent(name: 'Metode Pembayaran'),
    NameAndContent(name: 'Waktu Transaksi'),
    NameAndContent(name: 'Info Pesanan'),
    NameAndContent(name: 'ID Transaksi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('images/ceklis_big.png'),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Transaksi Berhasil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Pembelian ${_boxDetailTransaksi[0].content ?? 'NULL'} Menggunakan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  _boxDetailTransaksi[2].content ?? 'NULL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: Text(
                          "Total Harga",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          _boxDetailTransaksi[1].content ?? 'NULL',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        children: <Widget>[
                          ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _boxDetailTransaksi.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      _boxDetailTransaksi[index].name ?? 'NULL',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                        _boxDetailTransaksi[index].content ??
                                            'NULL'),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      BigButton(
                        title: 'Lihat Detail Transaksi',
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(widget.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
