import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/pemesanan/UI_components/checkout_pemesanan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/pemesanan/UI_components/detail_pemesanan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/pemesanan/UI_components/detail_penumpang.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details.dart';

List _perlindungan = [false, false];

class Pemesanan extends StatefulWidget {
  final List<List> data;

  Pemesanan({
    Key key,
    List<List> data,
  })  : this.data = data,
        super(key: key);

  @override
  _PemesananState createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  bool _isPemesanan = false;

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
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Penerbangan',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.0))),
                    child: Row(
                      children: [
                        Text(
                          'Jakarta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 40,
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
                  ),
                  InkWell(
                    onTap: () {
                      ticketDetails(
                          context, widget.data[0], widget.data[1], 'Pemesanan');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15.0))),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.data[1][2]} - ${widget.data[1][6]}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '20 Januari 2021 ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: 5,
                                  ),
                                  Text(
                                    ' 1 Dewasa ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    size: 5,
                                  ),
                                  Text(
                                    ' Ekonomi',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                              ),
                            ],
                          ),
                        ],
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
                      onTap: () {
                        detailPemesanan(context);
                      },
                      dense: true,
                      title: Text(
                        'Masukkan detail pemesanan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Icon(Icons.create, color: Colors.blue),
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
                        Icon(
                          Icons.toggle_off,
                          size: 40,
                        )
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
                      onTap: () {
                        detailPemesanan(context); // ganti jadi detail penumpang
                      },
                      dense: true,
                      title: Text(
                        'Penumpang 1: Dewasa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Icon(Icons.create, color: Colors.blue),
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
                        detailPemesanan(context); // ganti jadi detail penumpang
                      },
                      dense: true,
                      title: Text(
                        'Penumpang 2: Anak',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Icon(Icons.create, color: Colors.blue),
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
                        detailPemesanan(context); // ganti jadi detail penumpang
                      },
                      dense: true,
                      title: Text(
                        'Penumpang 3: Bayi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      trailing: Icon(Icons.create, color: Colors.blue),
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
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
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
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
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
                          color: Colors.blue,
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
                            child: Row(
                              children: [
                                Text(
                                  'Rp 29.000',
                                  style: TextStyle(
                                    color: Colors.blue,
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
                              'Kompensasi bila terjadi kecelakaan dan gangguan perjalanan hingga Rp 500.000.000'),
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
                            child: Row(
                              children: [
                                Text(
                                  'Rp 13.300',
                                  style: TextStyle(
                                    color: Colors.blue,
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
                              'Perlindungan dari kerusakan, hilang dan terlambat hingga Rp 25.000.000'),
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
