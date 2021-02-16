import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageGopay extends StatefulWidget {
  PageGopay({
    Key key,
  }) : super(key: key);

  @override
  _PageGopayState createState() => _PageGopayState();
}

class _PageGopayState extends State<PageGopay> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'GoPay',
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

  List<TopUpPackageModel> _gopay = [
    TopUpPackageModel(
        logoPath: "images/gopay-1.png",
        name: '[GP10] GoPay Costumer 10.000',
        price: 11425.0),
    TopUpPackageModel(
        logoPath: "images/gopay-1.png",
        name: '[GP20] GoPay Costumer 20.000',
        price: 21425.0),
    TopUpPackageModel(
        logoPath: "images/gopay-1.png",
        name: '[GP25] GoPay Costumer 25.000',
        price: 21700.0),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _gopay,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
