import 'package:flutter/material.dart';
import 'package:homepage/shared_UI_components/big_button.dart';

class TransCompleted extends StatefulWidget {
  final String pageName;
  const TransCompleted({Key key, @required this.pageName}) : super(key: key);

  @override
  _TransCompletedState createState() => _TransCompletedState();
}

class _TransCompletedState extends State<TransCompleted> {
  String transID = 'TRANS_ID';
  String transDate = 'TRANSACTION_DATE';
  String paymentMethod = 'PAYMENT_METHOD';
  String cost = 'Rp TOTAL_COST';
  String orderInfo = 'ORDER_INFO';

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
                  'Pembelian ${widget.pageName} Menggunakan',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  paymentMethod,
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
                          cost,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Info Pesanan',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(orderInfo),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Jumlah',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(cost),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Waktu Transaksi',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(transDate),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'ID Transaksi',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(transID),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      BigButton(
                        title: 'Lihat Detail Transaksi',
                        route: () {
                          Navigator.of(context).pushReplacementNamed(
                            '/trans_details',
                            arguments: widget.pageName,
                          );
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
