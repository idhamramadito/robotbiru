import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';
import 'package:homepage/shared_UI_components/card_cashback.dart';
import 'package:homepage/shared_UI_components/card_ringkasan.dart';
import 'package:homepage/shared_UI_components/form_nomor.dart';
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
  double _chosenPrice = 20000.00;
  double _accountBalance = 100000.00;

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
                        FormNomor(
                          prompt: 'ID Pelanggan / Nomor Meteran',
                          onChanged: (val) => setState(() {
                            _idNumber = val;
                          }),
                          onClear: () => setState(() {
                            _idNumber = '';
                          }),
                          externalPicker: IconButton(
                            icon: Icon(Icons.qr_code_scanner),
                            onPressed: _scanBarcode,
                          ),
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
                              NominalTokenListrik(),
                              CardRingkasan(pageName: 'Token Listrik'),
                              Divider(thickness: 5),
                              CardCashback(),
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

  Future<void> _scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#FF6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() {
        _idNumber = barcode ?? _idNumber;
      });
    } on PlatformException {
      // display error message
    }
  }
}
