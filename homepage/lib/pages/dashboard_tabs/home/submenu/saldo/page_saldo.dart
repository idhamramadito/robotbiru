import 'package:flutter/material.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';

class Saldo extends StatefulWidget {
  @override
  _SaldoState createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  TopUpModel _dataList = TopUpModel(
      currency: 'Rp',
      transactionType: 'Saldo',
      accountBalance: 100000,
      invoiceRoute: '/invoice_saldo',
      chosenPackage: TopUpPackageModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Top Up Saldo'),
      ),
      body: Container(
        // margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jumlah Top Up',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey[100]),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(_dataList.currency,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        )),
                  ),
                  Text('${_dataList.chosenPackage.name ?? ''}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jumlah top up minimal Rp 50.000.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoRadioChoice(
                  selectedColor: Theme.of(context).primaryColor,
                  choices: {
                    '50.000': '50.000',
                    '100.000': '100.000',
                    '150.000': '150.000'
                  },
                  onChange: (selectedPrice) {
                    setState(() {
                      _dataList.chosenPackage.name = selectedPrice;
                    });
                  },
                  initialKeyValue: '50.000'),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Metode Pembayaran',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/pilih_pembayaran_saldo');
              },
              title: Text(
                'Bayar Dengan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(color: Colors.black),
              ),
              leading: Image.asset(
                'images/kredit.png',
                height: 30,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 40,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
