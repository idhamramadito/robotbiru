import 'package:flutter/material.dart';
import 'package:homepage/models/passenggers_model.dart';
import 'package:homepage/models/order_detail_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/order_forms/UI_components/order_details_sheet.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/order_forms/UI_components/passenger_details_sheet.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/order_forms/UI_components/pemesanan_bottom_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details.dart';
import 'package:homepage/shared/shared_UI_components/detail_penerbangan.dart';

List _perlindungan = [false, false];

class Pemesanan extends StatefulWidget {
  Pemesanan({
    Key key,
  }) : super(key: key);

  @override
  _PemesananState createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  bool _sameAsBuyer = false;
  OrderDetailModel dataPemesanan = OrderDetailModel();
  List<PassengersModel> listDataPenumpang = [
    PassengersModel(),
    PassengersModel(),
    PassengersModel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Form Pemesanan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PenerbanganDetail(
              onTap: () {
                ticketDetails(context, 'Pemesanan');
              },
            ),
            Divider(thickness: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Pemesanan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () async {
                        final result = await orderDetailsSheet(context);
                        setState(() {
                          dataPemesanan = result ?? dataPemesanan;
                        });
                      },
                      dense: true,
                      title: (dataPemesanan.name == null)
                          ? Text(
                              'Masukkan detail pemesanan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : Text(
                              '${dataPemesanan.title ?? ''} ${dataPemesanan.name ?? ''}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                      subtitle: (dataPemesanan.name != null &&
                              (dataPemesanan.email != null ||
                                  dataPemesanan.phoneNumber != null))
                          ? Text(
                              '${dataPemesanan.email ?? 'Email Kosong'}\n${dataPemesanan.countryCode ?? ''}${dataPemesanan.phoneNumber ?? 'Nomor Telepon Kosong'}',
                              style: TextStyle(fontSize: 16),
                            )
                          : null,
                      trailing: Icon(
                        Icons.create,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Penumpang',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sama dengan pemesan',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Switch(
                          value: _sameAsBuyer,
                          onChanged: (val) {
                            setState(() {
                              _sameAsBuyer = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        '${listDataPenumpang[0].title ?? ''} ${listDataPenumpang[0].name ?? 'Penumpang 1: Dewasa'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: (listDataPenumpang[0].name == null)
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.create,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () async {
                        final result = await passengerDetailsSheet(context);
                        setState(() {
                          listDataPenumpang[0] = result ?? listDataPenumpang[0];
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        '${listDataPenumpang[1].title ?? ''} ${listDataPenumpang[1].name ?? 'Penumpang 2: Anak'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: (listDataPenumpang[1].name == null)
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.create,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () async {
                        final result = await passengerDetailsSheet(context);
                        setState(() {
                          listDataPenumpang[1] = result ?? listDataPenumpang[1];
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      dense: true,
                      title: Text(
                        '${listDataPenumpang[2].title ?? ''} ${listDataPenumpang[2].name ?? 'Penumpang 3: Bayi'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: (listDataPenumpang[2].name == null)
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.create,
                        color: Theme.of(context).primaryColor,
                      ),
                      onTap: () async {
                        final result = await passengerDetailsSheet(context);
                        setState(() {
                          listDataPenumpang[2] = result ?? listDataPenumpang[2];
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fasilitas Ekstra',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/bagasi');
                      },
                      leading: Image.asset('images/bagasi.png'),
                      title: Text(
                        'Bagasi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Tambah kapasitas barang bawaanmu.'),
                      trailing: Text(
                        'Pesan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        // Navigator.of(context).pushNamed(routeName)
                      },
                      leading: Image.asset('images/kursi.png'),
                      title: Text(
                        'Kursi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Pilih tempat duduk di pesawat.'),
                      trailing: Text(
                        'Pesan',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Perlindungan Ekstra',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: CheckboxListTile(
                      // onTap: () {
                      //   Navigator.of(context).pushNamed(routeName)
                      // },
                      title: const Text(
                        'Perlindungan Penuh',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: [
                                Text(
                                  'Rp 29.000',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  ' /Penumpang',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                              'Kompensasi bila terjadi kecelakaan dan gangguan perjalanan hingga\nRp 500.000.000'),
                        ],
                      ),
                      value: _perlindungan[0],
                      onChanged: (bool value) {
                        setState(() {
                          _perlindungan[0] = value;
                        });
                      },
                      secondary: Image.asset('images/shield.png'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: CheckboxListTile(
                      // onTap: () {},
                      //   Navigator.of(context).pushNamed(routeName)
                      // },
                      title: const Text(
                        'Asuransi Bagasi',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: [
                                Text(
                                  'Rp 13.300',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  ' /Penumpang',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                              'Perlindungan dari kerusakan, hilang dan terlambat hingga\nRp 25.000.000'),
                        ],
                      ),
                      value: _perlindungan[1],
                      onChanged: (bool value) {
                        setState(() {
                          _perlindungan[1] = value;
                        });
                      },
                      secondary: Image.asset('images/shield-2.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PemesananBottomBar(),
    );
  }
}
