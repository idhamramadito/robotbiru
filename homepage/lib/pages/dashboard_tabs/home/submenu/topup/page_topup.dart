import 'package:flutter/material.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class TopUp extends StatefulWidget {
  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
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
                    child: Text('Rp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        )),
                  ),
                  Text('50.000',
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
              child: CupertinoRadioChoice(choices: {
                'Rp50.000': 'Rp50.000',
                'Rp.100.000': 'Rp100.000',
                'Rp.150.000': 'Rp150.000'
              }, onChange: (selectedPrice) {}, initialKeyValue: 'Rp50.000'),
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
                Navigator.of(context).pushNamed('/topup_payment');
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
