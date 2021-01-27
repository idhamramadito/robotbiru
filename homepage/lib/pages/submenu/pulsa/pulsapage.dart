import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './components/input_baru.dart';
import './components/daftar_favorit.dart';

class PulsaPage extends StatefulWidget {
  PulsaPage({Key key}) : super(key: key);
  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pulsa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: DefaultTabController(
          length: 2,
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 11, 25, 29),
            child: Scaffold(
                appBar: TabBar(
                  unselectedLabelColor: Colors.blue[600],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  tabs: [
                    Tab(
                      text: "Input Baru",
                    ),
                    Tab(text: "Daftar Favorit")
                  ],
                ),
                body: Container(
                  padding: EdgeInsets.fromLTRB(0, 29, 0, 0),
                  child: TabBarView(
                    children: [
                      inputBaru(),
                      daftarFavorit(),
                    ],
                  ),
                )),
          )),
    );
  }
}
