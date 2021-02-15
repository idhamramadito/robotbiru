import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class TopUpPayment extends StatefulWidget {
  @override
  _TopUpPaymentState createState() => _TopUpPaymentState();
}

class _TopUpPaymentState extends State<TopUpPayment> {
  List _atm = [
    [
      'images/mandiri.png',
      'Bank Mandiri',
      '1320015081202',
      'PT EDUMATIC INTERNASIONAL'
    ],
    [
      'images/bca.png',
      'Bank BCA',
      '1320015081203',
      'PT EDUMATIC INTERNASIONAL'
    ],
    [
      'images/bjb.png',
      'Bank BJB',
      '1320015081204',
      'PT EDUMATIC INTERNASIONAL'
    ],
  ];

  var paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(),
              decoration: BoxDecoration(color: Colors.green),
              alignment: Alignment.center,
              child: Text('Proses Pengecekan Pembayaran sekitar 5-10 menit.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemExtent: 100,
              itemCount: _atm.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: _atm[index],
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                  title: Image.asset(_atm[index][0]),
                  secondary: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transfer ${_atm[index][1]}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${_atm[index][2]}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold)),
                      if (_atm[index][3] != '')
                        Text(
                          '${_atm[index][3]}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      Text(
                        'Jam Operasional 05:00:00-22:30:00 WIB',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        child: BigButton(
          title: 'Top Up',
          onPressed: (paymentMethod == null)
              ? null
              : () => Navigator.of(context).pushNamed('/permintaan_topup'),
        ),
      ),
    );
  }
}
