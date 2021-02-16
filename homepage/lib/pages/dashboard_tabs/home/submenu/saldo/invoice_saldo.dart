import 'package:flutter/material.dart';

class InvoiceSaldo extends StatelessWidget {
  final List _atm = [
    'images/bca.png',
    'Bank BCA',
    '1320015081203',
    'PT EDUMATIC INTERNASIONAL'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text(
                  'Top Up dengan Nominal',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 15),
                Wrap(
                  children: [
                    Image.asset('images/ceklis_big.png', height: 35),
                    SizedBox(width: 15),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: 'Rp 50.00'),
                          TextSpan(
                            text: '2',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff11c911),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Sukses',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ListTile(
                  leading: Image.asset(_atm[0]),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transfer ${_atm[1]}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${_atm[2]}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold)),
                      if (_atm[3] != '')
                        Text(
                          '${_atm[3]}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      Text(
                        'Jam Operasional 05:00:00-22:30:00 WIB',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
