import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './components/input_baru.dart';
import './components/daftar_favorit.dart';
import 'package:homepage/shared_UI_components/big_button.dart';

class TokenPage extends StatefulWidget {
  TokenPage({Key key}) : super(key: key);
  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Token Listrik',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          margin: EdgeInsets.fromLTRB(25, 11, 25, 29),
          child: Scaffold(
            appBar: TabBar(
              unselectedLabelColor: Theme.of(context).primaryColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              tabs: [Tab(text: "Input Baru"), Tab(text: "Daftar Favorit")],
            ),
            body: Column(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 29, 0, 0),
                    child: TabBarView(
                      children: [
                        InputBaru(),
                        DaftarFavorit(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: BigButton(
                    title: 'Beli',
                    route: () {
                      Navigator.of(context).pushNamed('/pin_code',
                          arguments: 'Masukkan Pin Anda');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
