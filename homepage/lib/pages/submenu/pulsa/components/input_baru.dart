import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputBaru extends StatefulWidget {
  inputBaru({Key key}) : super(key: key);

  @override
  _inputBaruState createState() => _inputBaruState();
}

class _inputBaruState extends State<inputBaru> {
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
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    defvalue = newValue;
                  });
                },
                items: <String>['20.000', '25.000', '35.000', '50.000']
                    .map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}