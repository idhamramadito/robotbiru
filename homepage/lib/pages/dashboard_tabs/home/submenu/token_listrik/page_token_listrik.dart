import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/card_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';
import 'package:homepage/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared_UI_components/custom_form.dart';
import 'package:homepage/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared_UI_components/checkout_bottom_bar.dart';

class PageTokenListrik extends StatefulWidget {
  PageTokenListrik({
    Key key,
  }) : super(key: key);

  @override
  _PageTokenListrikState createState() => _PageTokenListrikState();
}

class _PageTokenListrikState extends State<PageTokenListrik> {
  String _idNumber = '';
  bool _rememberNumber = false;
  String _currency = 'Rp';
  String _paymentMethod = 'Saldo Robot Biru';
  String _paymentLogo = 'images/dompet.png';
  String _chosenPrice = '21.750';
  String _accountBalance = '100.000';

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
            'Token Listrik',
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
                          prompt: 'ID Pelanggan / Nomor Meteran',
                          clearButton: true,
                          onChanged: (val) => setState(() {
                            _idNumber = val;
                          }),
                          externalPicker: 'barcode',
                        ),
                        RememberMeCheckBox(
                          onChanged: () => setState(() {
                            _rememberNumber = !_rememberNumber;
                          }),
                        ),
                        Visibility(
                          visible: (_idNumber != ''),
                          child: Column(
                            children: [
                              CardTokenListrik(idNumber: _idNumber),
                              NominalTokenListrik(
                                onChanged: (val) => setState(() {
                                  _chosenPrice = val;
                                }),
                              ),
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
          visible: (_idNumber != ''),
          child: CheckoutBottomBar(
            routeName: '/invoice_token_listrik',
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
