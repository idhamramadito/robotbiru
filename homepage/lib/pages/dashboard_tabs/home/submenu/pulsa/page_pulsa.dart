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

class PagePulsa extends StatefulWidget {
  PagePulsa({
    Key key,
  }) : super(key: key);

  @override
  _PagePulsaState createState() => _PagePulsaState();
}

class _PagePulsaState extends State<PagePulsa> {
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

  List<TopUpPackageModel> _pulsa = [
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: 'Pulsa 20000, 30 Hari',
        price: 19500.0),
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: 'Pulsa 25000, 30 Hari',
        price: 24500.0),
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: 'Pulsa 30000, 30 Hari',
        price: 29500.0),
  ];

  List<TopUpPackageModel> _paketData = [
    TopUpPackageModel(
        name: '[IY1] IDY1 - Indosat Data Yellow 1 GB, 1 Hari', price: 4975.0),
    TopUpPackageModel(
        name: '[IY3] IDY3 - Indosat Data Yellow 1 GB, 3 Hari', price: 6475.0),
    TopUpPackageModel(
        name: '[MI30] Indosat Data 300 mb 30 Hari', price: 6875.0),
  ];
  List<TopUpPackageModel> _ovo = [
    TopUpPackageModel(name: '[GR20] OVO20 - OVO Saldo 20rb', price: 21390.0),
    TopUpPackageModel(name: '[GR25] OVO25 - OVO Saldo 25rb', price: 26390.0),
    TopUpPackageModel(name: '[GR25] OVO50 - OVO Saldo 50rb', price: 51390.0),
  ];
  List<TopUpPackageModel> _gopay = [
    TopUpPackageModel(name: '[GP10] GoPay Costumer 10.000', price: 11425.0),
    TopUpPackageModel(name: '[GP20] GoPay Costumer 20.000', price: 21425.0),
    TopUpPackageModel(name: '[GP25] GoPay Costumer 25.000', price: 21700.0),
  ];
  List<TopUpPackageModel> _linkAja = [
    TopUpPackageModel(name: '[CH10] LinkAja 10k', price: 11325.0),
    TopUpPackageModel(name: '[CH20] LinkAja 20k', price: 21325.0),
    TopUpPackageModel(name: '[CH25] LinkAja 25k', price: 26325.0),
  ];
  List<TopUpPackageModel> _dana = [
    TopUpPackageModel(name: '[DN10] Saldo Dana 10.000', price: 11265.0),
    TopUpPackageModel(name: '[DN20] Saldo Dana 20.000', price: 21265.0),
    TopUpPackageModel(name: '[DN25] Saldo Dana 25.000', price: 26265.0),
  ];
  List<TopUpPackageModel> _shopee = [
    TopUpPackageModel(name: '[SP10] ShopeePay 10k', price: 11355.0),
    TopUpPackageModel(name: '[SP10] ShopeePay 20k', price: 21355.0),
    TopUpPackageModel(name: '[SP10] ShopeePay 30k', price: 31355.0),
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
                nominalList: _pulsa,
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
