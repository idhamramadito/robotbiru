import 'package:flutter/material.dart';
import 'package:homepage/models/transaction_attributes.dart';
import 'package:homepage/shared/shared_UI_components/paket_pulsa_kuota.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/custom_form.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
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
  String _chosenPrice = '20.000';
  String _accountBalance = '100.000';

  List<TransactionAttributes> _cashback = [
    TransactionAttributes(name: 'Pemilik Retail'),
    TransactionAttributes(name: 'Badan Koperasi'),
    TransactionAttributes(name: 'Anggota Koperasi'),
    TransactionAttributes(name: 'Anggota Retail'),
  ];

  List<TransactionAttributes> _ringkasan = [
    TransactionAttributes(name: 'Harga Dasar'),
    TransactionAttributes(name: 'Harga Dasar'),
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
                          externalPicker: 'contacts',
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
                              NominalPulsa(
                                onChanged: (val) => setState(() {
                                  _chosenPrice = val;
                                }),
                              ),
                              PaketPulsaKuota(amount: _chosenPrice),
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
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Text(
                          'Pilih Kontak',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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
