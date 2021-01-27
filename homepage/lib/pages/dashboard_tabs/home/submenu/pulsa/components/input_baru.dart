import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBaru extends StatefulWidget {
  InputBaru({Key key}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  bool rememberMe = false;
  String defvalue = "20.000";

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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Text(
                "Masukkan Nomor HP",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              children: [
                Flexible(
                  flex: 8,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.clear, size: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Nomor Handphone",
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Icon(Icons.perm_contact_cal, size: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 25, 0),
            child: Row(
              children: [
                Checkbox(value: rememberMe, onChanged: _onRememberMeChanged),
                Text("Simpan Nomor",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              children: [
                Text(
                  "Nominal Pulsa",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonTheme(
              minWidth: 300,
              height: 50,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/nominal_pulsa');
                },
                color: Color(0xffDDDDDD),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "20.000",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 3),
                  child: Text(
                    'Ringkasan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Image.asset("images/provider_indosat.png")),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 1, 0, 1),
                          child: Text(
                            "Pulsa 30.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            "Masa Aktif 40 Hari",
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
          Container(
            height: 15,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 3),
                  child: Text(
                    'Cashback',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Pemilik Retail"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Badan Koperasi"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Koperasi"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Retail"), new Text("Rp5800")]),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
          Container(
            height: 15,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
