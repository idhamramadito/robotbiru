import 'package:flutter/material.dart';

class TransCompleted extends StatefulWidget {
  final String hintText;
  const TransCompleted({Key key, this.hintText}) : super(key: key);

  @override
  _TransCompletedState createState() => _TransCompletedState();
}

class _TransCompletedState extends State<TransCompleted> {
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Transaksi Berhasil',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
