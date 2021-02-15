import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_data.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/card_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/shared/shared_UI_components/number_form.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';

class PageTokenListrik extends StatefulWidget {
  PageTokenListrik({
    Key key,
  }) : super(key: key);

  @override
  _PageTokenListrikState createState() => _PageTokenListrikState();
}

class _PageTokenListrikState extends State<PageTokenListrik> {
  bool _rememberNumber = false;
  String _currency = 'Rp';
  String _transactionType = 'Token Listrik';

  TopUpData _dataList = TopUpData(
    paymentMethod: 'Saldo Robot Biru',
    chosenPrice: 20000,
    accountBalance: 100000,
  );

  List<NameAndContent> _cashback = [
    NameAndContent(name: 'Pemilik Retail'),
    NameAndContent(name: 'Badan Koperasi'),
    NameAndContent(name: 'Anggota Koperasi'),
    NameAndContent(name: 'Anggota Retail'),
  ];

  List<NameAndContent> _ringkasan = [
    NameAndContent(name: 'Harga Dasar'),
    NameAndContent(name: 'Harga Dasar'),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$_transactionType',
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
                  _inputBaru(),
                  _daftarFavorit(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutBottomBar(
          routeName: '/invoice_token_listrik',
          currency: _currency,
          data: _dataList,
        ),
      ),
    );
  }
  //============================= main function ===============================

  Widget _inputBaru() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NumberForm(
            prompt: 'ID Pelanggan / Nomor Meteran',
            clearButton: true,
            onChanged: (val) => setState(() {
              _dataList.targetNumber = val;
            }),
            externalPicker: 'barcode',
          ),
          RememberMeCheckBox(
            onChanged: () => setState(() {
              _rememberNumber = !_rememberNumber;
            }),
          ),
          if (_dataList.targetNumber != null && _dataList.targetNumber != '')
            Column(
              children: [
                CardTokenListrik(idNumber: _dataList.targetNumber),
                NominalTokenListrik(
                  onChanged: (val) => setState(() {
                    _dataList.chosenPrice = val;
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ReceiptCard(
                    title: 'Ringkasan',
                    dataList: _ringkasan,
                  ),
                ),
                Divider(thickness: 5),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ReceiptCard(
                    title: 'Cashback',
                    dataList: _cashback,
                  ),
                ),
                Divider(thickness: 5),
              ],
            ),
        ],
      ),
    );
  }

  Widget _daftarFavorit() {
    return Center(
      child: Container(
        child: Text('Daftar Favorit Kosong'),
      ),
    );
  }
}
