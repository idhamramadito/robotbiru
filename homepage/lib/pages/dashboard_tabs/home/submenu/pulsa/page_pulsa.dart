import 'package:flutter/material.dart';
import 'package:homepage/shared_UI_components/paket_pulsa_kuota.dart';
import 'package:homepage/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared_UI_components/custom_form.dart';
import 'package:homepage/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/UI_components/nominal_pulsa.dart';

class PagePulsa extends StatefulWidget {
  PagePulsa({
    Key key,
  }) : super(key: key);

  @override
  _PagePulsaState createState() => _PagePulsaState();
}

class _PagePulsaState extends State<PagePulsa> {
  String _phoneNumber = '';
  bool _rememberNumber = false;
  String _currency = 'Rp';
  String _paymentMethod = 'Saldo Robot Biru';
  String _paymentLogo = 'images/dompet.png';
  double _chosenPrice = 20000.00;
  double _accountBalance = 100000.00;

  List _cashback = [
    ['Pemilik Retail', 'Rp5800'],
    ['Badan Koperasi', 'Rp5800'],
    ['Anggota Koperasi', 'Rp5800'],
    ['Anggota Retail', 'Rp5800'],
  ];

  List _ringkasan = [
    ['Harga Dasar', 'Rp5800'],
    ['Harga Dasar', 'Rp5800'],
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pulsa',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TabBar(
                unselectedLabelColor: Theme.of(context).primaryColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                tabs: [
                  Tab(text: "Input Baru"),
                  Tab(text: "Daftar Favorit"),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomForm(
                          prompt: 'Nomor Handphone',
                          clearButton: true,
                          onChanged: (val) => setState(() {
                            _phoneNumber = val;
                          }),
                          externalPicker: IconButton(
                            icon: Icon(Icons.perm_contact_cal),
                            onPressed: () {},
                          ),
                        ),
                        RememberMeCheckBox(
                          onChanged: () => setState(() {
                            _rememberNumber = !_rememberNumber;
                          }),
                        ),
                        Visibility(
                          visible: (_phoneNumber != ''),
                          child: Column(
                            children: [
                              NominalPulsa(),
                              PaketPulsaKuota(),
                              ReceiptCard(
                                cardName: 'Ringkasan',
                                dataList: _ringkasan,
                              ),
                              Divider(thickness: 5),
                              ReceiptCard(
                                cardName: 'Cashback',
                                dataList: _cashback,
                              ),
                              Divider(thickness: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text('Daftar Favorit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Visibility(
          visible: (_phoneNumber != ''),
          child: CheckoutBottomBar(
            routeName: '/invoice_pulsa',
            currency: _currency,
            paymentMethod: _paymentMethod,
            paymentLogo: _paymentLogo,
            accountBalance: _accountBalance,
            chosenPrice: _chosenPrice,
          ),
        ),
      ),
    );
  }
  //============================= main function ===============================
}
