import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class Pembayaran extends StatefulWidget {
  final TransportationModel previousData;

  Pembayaran({Key key, this.previousData}) : super(key: key);

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
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
    ['images/dompet.png', 'Saldo Robot Biru', 'Rp 50.000', ''],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Order ID : 348348348',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/ticket_details_page',
                      arguments: widget.previousData);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (widget.previousData.transportationType ==
                                'Pesawat')
                              Image.asset('images/pesawat_kecil.png'),
                            if (widget.previousData.transportationType ==
                                'Kereta')
                              Icon(Icons.train,
                                  color: Theme.of(context).primaryColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.previousData.origin,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              (widget.previousData.isTwoWayTrip)
                                  ? Icons.sync_alt
                                  : Icons.arrow_right_alt,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                widget.previousData.destination,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 30),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'Rp 445.565',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pilih Metode Pembayaran',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
                    groupValue: widget.previousData.paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        widget.previousData.paymentMethod = value;
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
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        child: BigButton(
          title: 'Konfirmasi Pembayaran',
          onPressed: (widget.previousData.paymentMethod == null)
              ? null
              : () => Navigator.of(context)
                  .pushNamed('/ringkasan', arguments: widget.previousData),
        ),
      ),
    );
  }
}
