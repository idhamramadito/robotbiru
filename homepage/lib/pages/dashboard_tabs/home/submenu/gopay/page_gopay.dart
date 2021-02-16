import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_UI_components/package_desc.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/number_form.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/shared/shared_UI_components/drop_down_jenis_nominal.dart';

class PageGopay extends StatefulWidget {
  PageGopay({
    Key key,
  }) : super(key: key);

  @override
  _PageGopayState createState() => _PageGopayState();
}

class _PageGopayState extends State<PageGopay> {
  bool _rememberNumber = false;

  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Pulsa',
    paymentMethod: 'Saldo Robot Biru',
    accountBalance: 100000,
    invoiceRoute: '/invoice_topup',
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

  List<TopUpPackageModel> _gopay = [
    TopUpPackageModel(
        logoPath: "images/gopay.png",
        name: '[GP10] GoPay Costumer 10.000',
        price: 11425.0),
    TopUpPackageModel(
        logoPath: "images/gopay.png",
        name: '[GP20] GoPay Costumer 20.000',
        price: 21425.0),
    TopUpPackageModel(
        logoPath: "images/gopay.png",
        name: '[GP25] GoPay Costumer 25.000',
        price: 21700.0),
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
              prompt: 'Nomor Handphone',
              clearButton: true,
              onChanged: (val) => setState(() {
                _dataList.targetNumber = val;
              }),
              externalPicker: 'contacts',
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
              child: DropDownJenisNominal(
                prevData: _dataList,
                nominalList: _gopay,
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
                PackageDesc(data: _dataList),
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
              // TODO: GANTI DENGAN DAFTAR NOMOR FAVORIT
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
