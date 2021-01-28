import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/transaction_process/invoice/invoice_pulsa.dart';

import 'invoice/invoice_tokenlistrik.dart';

class TransDetails extends StatelessWidget {
  final String pageName;
  TransDetails({Key key, @required this.pageName}) : super(key: key);

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
            child: (pageName == 'Pulsa') ? InvoicePulsa() : InvoiceListrik(),
          ),
        ),
      ),
    );
  }
  //============================= main function ===============================
}
