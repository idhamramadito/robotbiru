import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PagePaketData extends StatefulWidget {
  PagePaketData({
    Key key,
  }) : super(key: key);

  @override
  _PagePulsaState createState() => _PagePulsaState();
}

class _PagePulsaState extends State<PagePaketData> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Paket Data',
    paymentMethod: 'Saldo Robot Biru',
    accountBalance: 100000,
    invoiceRoute: '/invoice_topup',
  );

  List<NameAndContent> _cashback = [
    NameAndContent(name: 'Pemilik Retail', content: null),
    NameAndContent(name: 'Badan Koperasi', content: null),
    NameAndContent(name: 'Anggota Koperasi', content: null),
    NameAndContent(name: 'Anggota Retail', content: null),
  ];

  List<NameAndContent> _ringkasan = [
    NameAndContent(name: 'Harga Dasar', content: null),
    NameAndContent(name: 'Harga Dasar', content: null),
  ];

  List<TopUpPackageModel> _paketData = [
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: '[IY1] IDY1 - Indosat Data Yellow 1 GB, 1 Hari',
        price: 4975.0),
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: '[IY3] IDY3 - Indosat Data Yellow 1 GB, 3 Hari',
        price: 6475.0),
    TopUpPackageModel(
        logoPath: "images/provider_indosat.png",
        name: '[MI30] Indosat Data 300 mb 30 Hari',
        price: 6875.0),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _paketData,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
