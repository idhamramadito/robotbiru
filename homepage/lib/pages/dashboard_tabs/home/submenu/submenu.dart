import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/daftar_favorit.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/input_baru.dart';
import 'package:homepage/shared_UI_components/big_button.dart';

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
  String currency = 'Rp';
  double chosenPrice = 20000.00;

  @override
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
        bottomNavigationBar: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'Total Akhir:  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '$currency ${chosenPrice.toString()}',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                BigButton(
                  title: 'Beli',
                  route: () {
                    Navigator.of(context)
                        .pushNamed('/pin_code', arguments: 'Masukkan Pin Anda');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
