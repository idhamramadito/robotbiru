import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_pages/top_up_page_template.dart';

class PageTokenListrik extends StatefulWidget {
  PageTokenListrik({
    Key key,
  }) : super(key: key);

  @override
  _PageTokenListrikState createState() => _PageTokenListrikState();
}

class _PageTokenListrikState extends State<PageTokenListrik> {
  TopUpModel _dataList = TopUpModel(
    currency: 'Rp',
    transactionType: 'Token Listrik',
    paymentMethod: 'Saldo Robot Biru',
    accountBalance: 100000,
    invoiceRoute: '/invoice_token_listrik',
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

  List<TopUpPackageModel> _tokenListrik = [
    TopUpPackageModel(name: '20.000', price: 21750),
    TopUpPackageModel(name: '50.000', price: 51750),
    TopUpPackageModel(name: '75.000', price: 71750),
    TopUpPackageModel(name: '100.000', price: 100750),
    TopUpPackageModel(name: '500.000', price: 501750),
    TopUpPackageModel(name: '1.000.000', price: 1001750),
    TopUpPackageModel(name: '5.000.000', price: 5001750),
    TopUpPackageModel(name: '10.000.000', price: 10001750),
    TopUpPackageModel(name: '50.000.000', price: 50001750),
  ];

  double _packageCashback = 750;
  double _fee = 1750;

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return TopUpPageTemplate(
      dataList: _dataList,
      packageList: _tokenListrik,
      packageCashback: _packageCashback,
      fee: _fee,
      ringkasan: _ringkasan,
      cashback: _cashback,
    );
  }
  //============================= main function ===============================
}
