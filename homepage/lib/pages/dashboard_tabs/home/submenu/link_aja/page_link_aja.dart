import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageLinkAja extends StatefulWidget {
  PageLinkAja({
    Key key,
  }) : super(key: key);

  @override
  _PageLinkAjaState createState() => _PageLinkAjaState();
}

class _PageLinkAjaState extends State<PageLinkAja> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Link Aja',
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

  List<TopUpPackageModel> _linkAja = [
    TopUpPackageModel(
        name: '[CH10] LinkAja 10k',
        price: 11325.0,
        logoPath: 'images/link_aja_kotak.png'),
    TopUpPackageModel(
        name: '[CH20] LinkAja 20k',
        price: 21325.0,
        logoPath: 'images/link_aja_kotak.png'),
    TopUpPackageModel(
        name: '[CH25] LinkAja 25k',
        price: 26325.0,
        logoPath: 'images/link_aja_kotak.png'),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _linkAja,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
