import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/daftar_favorit.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/input_baru.dart';
import 'package:homepage/shared_UI_components/big_button.dart';

class PulsaPage extends StatefulWidget {
  final String pageName;
  PulsaPage({Key key, this.pageName}) : super(key: key);

  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  String currency = 'Rp';
  double chosenPrice = 20000.00;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pulsa', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  InputBaru(),
                  DaftarFavorit(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              )
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
                    Navigator.of(context).pushNamed('/detail_pulsa',
                        arguments: 'Masukkan Pin Anda');
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
