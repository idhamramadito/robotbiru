import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageShopeePay extends StatefulWidget {
  PageShopeePay({
    Key key,
  }) : super(key: key);

  @override
  _PageShopeePayState createState() => _PageShopeePayState();
}

class _PageShopeePayState extends State<PageShopeePay> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'ShopeePay',
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

  List<TopUpPackageModel> _shopeePay = [
    TopUpPackageModel(
      name: '[SP10] ShopeePay 10k',
      price: 11355.0,
      logoPath: "images/shopee-pay_transparent.png",
    ),
    TopUpPackageModel(
      name: '[SP10] ShopeePay 20k',
      price: 21355.0,
      logoPath: "images/shopee-pay_transparent.png",
    ),
    TopUpPackageModel(
      name: '[SP10] ShopeePay 30k',
      price: 31355.0,
      logoPath: "images/shopee-pay_transparent.png",
    ),
  ];

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _shopeePay,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
