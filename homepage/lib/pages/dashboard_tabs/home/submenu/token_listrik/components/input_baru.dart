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
List boxAtas = [['20.000', 'Cashback: Rp 750.00', 'Rp21.750'], ['50.000', 'Cashback: Rp 750.00', 'Rp51.750'], ['75.000', 'Cashback: Rp 750.00', 'Rp75.750']];
List boxBawah = [['100.000', 'Cashback: Rp 750.00', 'Rp101.750'], ['200.000', 'Cashback: Rp 750.00', 'Rp201.750'], ['500.000', 'Cashback: Rp 750.00', 'Rp501.750']];

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
              "Masukkan ID Pelanggan / Nomor Meteran",
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
                    hintText: "ID Pelanggan / Nomor Meteran",
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
                "Nominal Token Listrik",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),

    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                      
                      boxAtas[index][0],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                        boxAtas[index][1],
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.grey),
                        textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: Text(
                        boxAtas[index][2],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                        textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),

      Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                      
                      boxBawah[index][0],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(
                        boxBawah[index][1],
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.grey),
                        textAlign: TextAlign.left,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: Text(
                        boxBawah[index][2],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[700]),
                        textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ),
        
         // Row(
           // children: [
             // DropdownButton<String>(
               // value: defvalue,
               // icon: Icon(Icons.arrow_downward),
               // iconSize: 24,
               // elevation: 16,
               // style: TextStyle(color: Colors.deepPurple),
               // underline: Container(
                //  height: 2,
                //  color: Colors.deepPurpleAccent,
               // ),
               // onChanged: (String newValue) {
                  //setState(() {
                    //defvalue = newValue;
                  //});
                //},
                //items: <String>[
                  //'20.000',
                  //'50.000',
                  //'100.000',
                  //'200.000',
                 // '500.000'
                //].map<DropdownMenuItem<String>>((String value) {
                 // return DropdownMenuItem<String>(
                  //  value: value,
                  //  child: Text(value),
                //  );
              //  }).toList(),
            //  )
          //  ],
        //  ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}