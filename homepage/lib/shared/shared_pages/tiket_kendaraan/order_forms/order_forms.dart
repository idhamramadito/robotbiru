import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/order_detail_model.dart';
import 'package:homepage/models/passenggers_model.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/detail_penerbangan.dart';
import 'package:homepage/shared/shared_UI_components/order_details_sheet.dart';
import 'package:homepage/shared/shared_UI_components/passenger_details_sheet.dart';
import 'package:homepage/shared/shared_UI_components/pemesanan_bottom_bar.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/ticket_details/ticket_details.dart';

class OrderForms extends StatefulWidget {
  final TransportationModel prevData;

  OrderForms({
    Key key,
    this.prevData,
  }) : super(key: key);

  @override
  _OrderFormsState createState() => _OrderFormsState();
}

class _OrderFormsState extends State<OrderForms> {
  @override
  void initState() {
    widget.prevData.orderDetails = OrderDetailModel();
    widget.prevData.passengersDetails = [];
    widget.prevData.sameAsBuyer = false;
    widget.prevData.fullProtection = false;
    widget.prevData.luggageInsurance = false;
    for (int i = 0; i < widget.prevData.passengersAmount.length; i++) {
      if (widget.prevData.passengersAmount[i].content > 0) {
        for (int j = 0; j < widget.prevData.passengersAmount[i].content; j++) {
          widget.prevData.passengersDetails.add(PassengersModel(
              ageType: widget.prevData.passengersAmount[i].name));
        }
      }
    }

    super.initState();
  }

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
            DetailPenerbangan(
              previousData: widget.prevData,
              onTap: (index) {
                if (index == 0) {
                  ticketDetails(context, 'Pemesanan',
                      widget.prevData.chosenDepartSchedule, widget.prevData);
                } else if (index == 1) {
                  ticketDetails(context, 'Pemesanan',
                      widget.prevData.chosenReturnSchedule, widget.prevData);
                }
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
                        OrderDetailModel result = await orderDetailsSheet(
                            context, widget.prevData.orderDetails);
                        setState(() {
                          widget.prevData.orderDetails =
                              result ?? widget.prevData.orderDetails;
                        });
                      },
                      dense: true,
                      title: (widget.prevData.orderDetails.name == null)
                          ? Text(
                              'Masukkan detail pemesanan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : Text(
                              '${widget.prevData.orderDetails.title ?? ''} ${widget.prevData.orderDetails.name ?? ''}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                      subtitle: (widget.prevData.orderDetails.name != null &&
                              (widget.prevData.orderDetails.email != null ||
                                  widget.prevData.orderDetails.phoneNumber !=
                                      null))
                          ? Text(
                              '${widget.prevData.orderDetails.email ?? 'Email Kosong'}\n${widget.prevData.orderDetails.countryCode ?? ''}${widget.prevData.orderDetails.phoneNumber ?? 'Nomor Telepon Kosong'}',
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
                    child: SwitchListTile(
                      title: Text(
                        'Sama dengan pemesan',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      value: widget.prevData.sameAsBuyer,
                      onChanged: (val) {
                        setState(() {
                          widget.prevData.sameAsBuyer = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.prevData.passengersDetails.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            dense: true,
                            title: Text(
                              '${widget.prevData.passengersDetails[index].title ?? ''} ${widget.prevData.passengersDetails[index].name ?? 'Penumpang ${index + 1}: ${widget.prevData.passengersDetails[index].ageType}'}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: (widget.prevData.passengersDetails[index]
                                            .name ==
                                        null)
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            trailing: Icon(
                              Icons.create,
                              color: Theme.of(context).primaryColor,
                            ),
                            onTap: () async {
                              final result = await passengerDetailsSheet(
                                  context,
                                  widget.prevData.passengersDetails[index]);
                              setState(() {
                                widget.prevData.passengersDetails[index] =
                                    result ??
                                        widget
                                            .prevData.passengersDetails[index];
                              });
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
            // if (widget.prevData.transportationType.contains('Pesawat'))
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
                  if (widget.prevData.transportationType.contains('Pesawat'))
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () async {
                          var result = await Navigator.of(context)
                              .pushNamed('/bagasi', arguments: widget.prevData);
                          setState(() {
                            widget.prevData.luggageSize = result;
                          });
                        },
                        leading: Image.asset('images/bagasi.png'),
                        title: Text(
                          'Bagasi',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text((widget.prevData.luggageSize == null)
                            ? 'Tambah kapasitas barang bawaanmu.'
                            : 'Pergi: ${widget.prevData.luggageSize[0]}, Pulang: ${widget.prevData.luggageSize[1] ?? '-'}'),
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
                  if (widget.prevData.transportationType.contains('Kereta'))
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      'Asuransi',
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          secondary: Image.asset('images/shield.png'),
                          title: const Text(
                            'Perlindungan Penuh',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Rp 29.000',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' / Penumpang',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.prevData.transportationType
                                  .contains('Pesawat'))
                                Text(
                                    'Kompensasi bila terjadi kecelakaan dan gangguan perjalanan hingga Rp500.000.000'),
                              if (widget.prevData.transportationType
                                  .contains('Kereta'))
                                Text(
                                    'Asuransi ini berlaku untuk warga Negara Indonesia dan Warga Negara Asing yang memiliki izin tinggal di Indonesia. Traveler yang memenuhi syarat berhak atas kompensasi perjalanan hingga Rp8.500.000'),
                            ],
                          ),
                          value: widget.prevData.fullProtection,
                          onChanged: (bool value) {
                            setState(() {
                              widget.prevData.fullProtection = value;
                            });
                          },
                        ),
                        if (widget.prevData.transportationType
                            .contains('Pesawat'))
                          Divider(thickness: 2),
                        if (widget.prevData.transportationType
                            .contains('Pesawat'))
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Asuransi Bagasi',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Rp 13.300',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' / Penumpang',
                                        style: TextStyle(
                                          color: Colors.grey,
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
                            value: widget.prevData.luggageInsurance,
                            onChanged: (bool value) {
                              setState(() {
                                widget.prevData.luggageInsurance = value;
                              });
                            },
                            secondary: Image.asset('images/shield-2.png'),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  if (widget.prevData.transportationType.contains('Kereta'))
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  'Dengan menekan tombol, kamu menyetujui Kebijakan Privasi dan'),
                          TextSpan(
                            text: ' Syarat & Ketentuan ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed('/syarat_dan_ketentuan');
                              },
                          ),
                          TextSpan(text: 'PT KAI'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PemesananBottomBar(prevData: widget.prevData),
    );
  }
}
