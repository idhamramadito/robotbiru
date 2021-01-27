import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PulsaPage extends StatefulWidget {
  PulsaPage({Key key}) : super(key: key);
  @override
  _PulsaPageState createState() => _PulsaPageState();
}

class _PulsaPageState extends State<PulsaPage> {
  bool rememberMe = false;
  String defvalue = '20.000';
  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
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
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
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
                      SingleChildScrollView(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: <Widget>[
                              Text(
                                "Masukkan Nomor HP",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Container(
                                width: 250,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ]),
                            Row(
                              children: [
                                Checkbox(
                                    value: rememberMe,
                                    onChanged: _onRememberMeChanged),
                                Text("Simpan Nomor",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: defvalue,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      defvalue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    '20.000',
                                    '25.000',
                                    '35.000',
                                    '50.000'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      ),
                      Text("Daftar Favorit"),
                    ],
                  ),
                )),
          )),
    );
  }
}
