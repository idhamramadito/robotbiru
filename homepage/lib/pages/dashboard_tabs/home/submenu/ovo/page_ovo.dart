import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageOvo extends StatefulWidget {
  PageOvo({
    Key key,
  }) : super(key: key);

  @override
  _PageOvoState createState() => _PageOvoState();
}

class _PageOvoState extends State<PageOvo> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'OVO',
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

  List<TopUpPackageModel> _ovo = [
    TopUpPackageModel(
      name: '[GR20] OVO20 - OVO Saldo 20rb',
      price: 21390.0,
      logoPath: "images/ovo_white.png",
    ),
    TopUpPackageModel(
      name: '[GR25] OVO25 - OVO Saldo 25rb',
      price: 26390.0,
      logoPath: "images/ovo_white.png",
    ),
    TopUpPackageModel(
      name: '[GR25] OVO50 - OVO Saldo 50rb',
      price: 51390.0,
      logoPath: "images/ovo_white.png",
    ),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _ovo,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
