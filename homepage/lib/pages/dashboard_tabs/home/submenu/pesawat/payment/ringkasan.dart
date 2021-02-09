import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/detail_penerbangan.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/white_button.dart';
import 'package:homepage/shared/shared_pages/get_picture.dart';
import 'package:image_picker/image_picker.dart';

class Ringkasan extends StatefulWidget {
  final TransportationModel previousData;

  Ringkasan({
    Key key,
    this.previousData,
  }) : super(key: key);

  @override
  _RingkasanState createState() => _RingkasanState();
}

class _RingkasanState extends State<Ringkasan> {
  List<NameAndContent> _paymentDetails = [
    NameAndContent(name: 'Status', content: 'UNPAID'),
    NameAndContent(name: 'Total Bayar', content: '485.000'),
    NameAndContent(name: 'Total', content: '485.000'),
  ];

  PickedFile imagFile;
  File croppedImageFile;

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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Silahkan Transfer Ke',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ReceiptCard(
                    title: 'Rincian Pembayaran',
                    dataList: _paymentDetails,
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                DetailPenerbangan(
                  previousData: widget.previousData,
                  onTap: () {
                    Navigator.of(context).pushNamed('/detail_penerbangan',
                        arguments: widget.previousData);
                  },
                ),
                SizedBox(height: 20),
                Divider(thickness: 10),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Foto Bukti Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Setelah Anda selesai melakukan transfer pembayaran, Anda wajib lakukan foto bukti pembayaran.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            var result =
                                await getPicture(context, ImageSource.camera);
                            setState(() => croppedImageFile = result);
                          },
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
                          onTap: () async {
                            var result =
                                await getPicture(context, ImageSource.gallery);
                            setState(() => croppedImageFile = result);
                          },
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: (croppedImageFile == null)
                        ? Text('No image selected')
                        : Image.file(croppedImageFile, width: double.infinity),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: BigButton(
                    onPressed: () {},
                    title: 'Lihat Riwayat Pesan Tiket',
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: WhiteButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
