import 'package:flutter/material.dart';
import 'package:homepage/shared_UI_components/big_button.dart';

class TransCompleted extends StatefulWidget {
  final List data;
  const TransCompleted({Key key, this.data}) : super(key: key);

  @override
  _TransCompletedState createState() => _TransCompletedState();
}

class _TransCompletedState extends State<TransCompleted> {
  String transName = 'TRANSACTION_TYPE';
  String paymentMethod = 'PAYMENT_METHOD';
  String price = 'TOTAL_COST';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
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
                'Pembelian $transName Menggunakan',
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
                    Text(
                      "Total Hargga",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp $price',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    BigButton(
                      title: 'Lihat Detail Transaksi',
                      route: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/trans_details');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
