import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class Pembayaran extends StatefulWidget {
  final List<List> data;

  Pembayaran({
    Key key,
    List<List> data,
  })  : this.data = data,
        super(key: key);

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
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
            Visibility(
              visible: true,
              child: Text(
                'Order ID : 348348348',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
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
                  ticketDetails(
                      context, widget.data[0], widget.data[1], 'Pemesanan');
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/pesawat_kecil.png'),
                          Text(
                            'Jakarta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            size: 30,
                          ),
                          Text(
                            'Denpasar - Bali',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 30)
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
                          color: Colors.blue,
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Radio(
                      value: _atm[index],
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    title: Image.asset(_atm[index]),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Transfer Bank Mandiri',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('1320015081202',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'PT EDUMATIC INTERNASIONAL',
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
              ListTile(
                leading: Radio(
                  value: 'Saldo',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
                title: Text(
                  'Saldo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Saldo Anda akan otomatis terpotong untuk pembayaran Tiket Pesawat'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp 50.000',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        child: BigButton(
          title: 'Konfirmasi Pembayaran',
          onPressed: () {
            // Navigator.of(context).pushNamed(routeName)
          },
        ),
      ),
    );
  }
}

List _atm = ['images/mandiri.png', 'images/bca.png', 'images/bjb.png', 'Saldo'];
var selectedValue;
