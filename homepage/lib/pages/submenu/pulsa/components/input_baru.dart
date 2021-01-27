import 'package:buttons_tabbar/buttons_tabbar.dart';
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
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            Text(
              "Masukkan Nomor HP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 5),
          Row(
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
          Row(
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
          Row(
            children: [
              Text(
                "Nominal Pulsa",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
<<<<<<< HEAD
          Row(
            children: [],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonTheme(
              minWidth: 300,
              height: 50,
              child: FlatButton(
                onPressed: () {},
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
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff818181)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Icon(Icons.arrow_drop_down),
                    )
                  ],
=======
          

    Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
            onPressed: () {Navigator.of(context).pushNamed('/nominal_pulsa');},
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
                    style: TextStyle(fontSize: 15, color: Color(0xff818181)),
                    textAlign: TextAlign.center,
                  ),
>>>>>>> d28d7814fc878ffc9c7b98dda41617f0547d7025
                ),
              ),
            ),
          ),
          Row(
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
          Row(
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
                          "Pulsa 20.000",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "Masa Aktif 30 Hari",
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
