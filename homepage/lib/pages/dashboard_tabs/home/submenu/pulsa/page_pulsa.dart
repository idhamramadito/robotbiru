import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PagePulsa extends StatefulWidget {
  PagePulsa({
    Key key,
  }) : super(key: key);

  @override
  _PagePulsaState createState() => _PagePulsaState();
}

class _PagePulsaState extends State<PagePulsa> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Pulsa',
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

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _pulsa,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
