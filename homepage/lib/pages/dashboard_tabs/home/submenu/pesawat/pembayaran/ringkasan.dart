import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/white_button.dart';
import 'package:homepage/shared/shared_pages/choose_picture.dart';
import '../ticket_details.dart';

class Ringkasan extends StatefulWidget {
  final List<List> data;

  Ringkasan({
    Key key,
    List<List> data,
  })  : this.data = data,
        super(key: key);

  @override
  _RingkasanState createState() => _RingkasanState();
}

class _RingkasanState extends State<Ringkasan> {
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
              'Bank BCA',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(),
              decoration: BoxDecoration(color: Colors.green),
              alignment: Alignment.center,
              child: Text('Batas Waktu : 2021:01:21  19:20:00',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    'Silahkan Transfer Ke',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Container(
                    height: 350,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ATM',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BCA',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Image.asset('images/bca.png')
                          ],
                        ),
                        Divider(),
                        // Divider(),
                        Text(
                          'Atas Nama',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'PT EDUMATIC INTERNASIONAL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Divider(),
                        // Divider(
                        //   color: Colors.transparent,
                        // ),
                        Text(
                          'Nomer Rekening',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '7772420016',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              'Salin',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(
                          'Nomer Rekening',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[400]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rp. 485.001',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Divider(),
                        Text(
                          '*Harap transfer jumlah yang tepat untuk memudahkan verifikasi pembayaran sesuai',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 10),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    'Rincian Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'UNPAID',
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Bayar',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '485.000',
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '485.000',
                        style: TextStyle(color: Colors.grey[400], fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Transfer',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '485.000',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 10),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    'Detail Penerbangan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
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
                ),
                InkWell(
                  onTap: () {
                    ticketDetails(context, 'Pemesanan');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                              'CGK - DPS',
                              // '${widget.data[1][2]} - ${widget.data[1][6]}',
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
                ),
                SizedBox(height: 20),
                Divider(thickness: 10),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    'Foto Bukti Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: Text(
                    'Setelah Anda selesai melakukan transfer pembayaran, Anda wajib lakukan foto bukti pembayaran.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: DottedBorder(
                            dashPattern: [5, 5],
                            color: Colors.grey[300],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 50,
                                    color: Colors.grey[300],
                                  ),
                                  Text(
                                    'Kamera',
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: DottedBorder(
                            dashPattern: [5, 5],
                            color: Colors.grey[300],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo,
                                    size: 50,
                                    color: Colors.grey[300],
                                  ),
                                  Text(
                                    'Pilih Foto',
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: BigButton(
                    onPressed: () {},
                    title: 'Lihat Riwayat Pesan Tiket',
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: WhiteButton(
                    onPressed: () {},
                    title: 'Ubah Metode Pembayaran',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
