import 'package:flutter/material.dart';

class TransCompleted extends StatefulWidget {
  final String hintText;
  const TransCompleted({Key key, this.hintText}) : super(key: key);

  @override
  _TransCompletedState createState() => _TransCompletedState();
}

class _TransCompletedState extends State<TransCompleted> {
  String currentText = '';
  String transName = 'Token Listrik';
  String paymentMethod = 'Saldo Robot Biru';

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
          ],
        ),
      ),
    );
  }
}
