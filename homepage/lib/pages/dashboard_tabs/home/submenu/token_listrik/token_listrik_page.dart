import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/form_no_meteran.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';
import 'package:homepage/shared_UI_components/card_cashback.dart';
import 'package:homepage/shared_UI_components/card_ringkasan.dart';
import 'package:homepage/shared_UI_components/rememberme_checkbox.dart';
import 'package:homepage/shared_UI_components/checkout_bottom_bar.dart';

class TokenListrikPage extends StatefulWidget {
  TokenListrikPage({
    Key key,
  }) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<TokenListrikPage> {
  String _currency = 'Rp';
  String _paymentMethod = 'Saldo Robot Biru';
  String _paymentLogo = 'images/dompet.png';
  double _chosenPrice = 20000.00;
  double _accountBalance = 100000.00;

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Token Listrik',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            Flexible(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FormNoMeteran(),
                        RememberMeCheckBox(),
                        NominalTokenListrik(),
                        CardRingkasan(pageName: 'Token Listrik'),
                        Divider(thickness: 5),
                        CardCashback(),
                        Divider(thickness: 5),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text('Daftar Favorit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutBottomBar(
          pageName: 'Token Listrik',
          currency: _currency,
          paymentMethod: _paymentMethod,
          paymentLogo: _paymentLogo,
          accountBalance: _accountBalance,
          chosenPrice: _chosenPrice,
        ),
      ),
    );
  }
  //============================= main function ===============================
}
