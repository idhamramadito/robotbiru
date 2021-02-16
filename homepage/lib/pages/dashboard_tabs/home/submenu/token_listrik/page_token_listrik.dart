import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/number_form.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/card_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';

class PageTokenListrik extends StatefulWidget {
  PageTokenListrik({
    Key key,
  }) : super(key: key);

  @override
  _PageTokenListrikState createState() => _PageTokenListrikState();
}

class _PageTokenListrikState extends State<PageTokenListrik> {
  bool _rememberNumber = false;

  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Token Listrik',
    paymentMethod: 'Saldo Robot Biru',
    accountBalance: 100000,
    invoiceRoute: '/invoice_token_listrik',
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
            '${_dataList.transactionType}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
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
            SizedBox(height: 10),
            Flexible(
              child: TabBarView(
                children: [
                  _inputBaru(),
                  _daftarFavorit(context),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutBottomBar(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: NumberForm(
              prompt: 'ID Pelanggan / Nomor Meteran',
              clearButton: true,
              onChanged: (val) => setState(() {
                _dataList.targetNumber = val;
              }),
              externalPicker: 'barcode',
            ),
          ),
          RememberMeCheckBox(
            onChanged: () => setState(() {
              _rememberNumber = !_rememberNumber;
            }),
          ),
          if (_dataList.targetNumber != null && _dataList.targetNumber != '')
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CardTokenListrik(idNumber: _dataList.targetNumber),
            ),
          if (_dataList.targetNumber != null && _dataList.targetNumber != '')
            Padding(
              padding: EdgeInsets.all(15),
              child: NominalTokenListrik(
                data: _dataList,
                onChanged: (val) => setState(() {
                  _dataList.chosenPackage = val;
                }),
              ),
            ),
          if (_dataList.targetNumber != null &&
              _dataList.targetNumber != '' &&
              _dataList.chosenPackage != null)
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ReceiptCard(
                    title: 'Ringkasan',
                    dataList: _ringkasan,
                  ),
                ),
                Divider(thickness: 5),
                Padding(
                  padding: EdgeInsets.all(15),
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

  Widget _daftarFavorit(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Pilih Kontak',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nomor:',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () async {
              final result =
                  await Navigator.of(context).pushNamed('/contacts_picker');
              setState(() {
                _dataList.targetNumber = result ?? _dataList.targetNumber;
              });
            },
          ),
        ),
      ],
    );
  }
}
