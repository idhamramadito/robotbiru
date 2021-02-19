import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageDana extends StatefulWidget {
  PageDana({
    Key key,
  }) : super(key: key);

  @override
  _PageDanaState createState() => _PageDanaState();
}

class _PageDanaState extends State<PageDana> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Dana',
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

  List<TopUpPackageModel> _dana = [
    TopUpPackageModel(
        name: '[DN10] Saldo Dana 10.000',
        price: 11265.0,
        logoPath: "images/dana_kecil.png"),
    TopUpPackageModel(
        name: '[DN20] Saldo Dana 20.000',
        price: 21265.0,
        logoPath: "images/dana_kecil.png"),
    TopUpPackageModel(
        name: '[DN25] Saldo Dana 25.000',
        price: 26265.0,
        logoPath: "images/dana_kecil.png"),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _dana,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
