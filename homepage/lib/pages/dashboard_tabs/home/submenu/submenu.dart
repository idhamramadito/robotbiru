import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/UI_Components/checkout_bottom_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/daftar_favorit.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/input_baru.dart';

class SubMenu extends StatefulWidget {
  final String pageName;
  SubMenu({
    Key key,
    @required this.pageName,
  }) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
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
            widget.pageName,
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
                  InputBaru(pageName: widget.pageName),
                  DaftarFavorit(pageName: widget.pageName),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutBottomBar(
          pageName: widget.pageName,
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
