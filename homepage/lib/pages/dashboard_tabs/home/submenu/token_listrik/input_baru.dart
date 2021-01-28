import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class InputBaru extends StatefulWidget {
  InputBaru({Key key}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  bool rememberMe = false;
  int selectedIndex = 0;
  String selectedValue = '20.000';
  List boxTokenListrik = [
    ['20.000', 'Cashback: Rp 750.00', 'Rp21.750'],
    ['50.000', 'Cashback: Rp 750.00', 'Rp51.750'],
    ['75.000', 'Cashback: Rp 750.00', 'Rp75.750'],
    ['100.000', 'Cashback: Rp 750.00', 'Rp101.750'],
    ['200.000', 'Cashback: Rp 750.00', 'Rp201.750'],
    ['500.000', 'Cashback: Rp 750.00', 'Rp501.750'],
    ['1.000.000', 'Cashback: Rp 750.00', 'Rp1.001.750'],
    ['5.000.000', 'Cashback: Rp 750.00', 'Rp5.001.750'],
    ['10.000.000', 'Cashback: Rp 750.00', 'Rp10.001.750'],
    ['50.000.000', 'Cashback: Rp 750.00', 'Rp50.001.750'],
  ];

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
                flex: 7,
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
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/scan_barcode');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Icon(Icons.qr_code_scanner_outlined, size: 30),
                    ),
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
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: boxTokenListrik.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.55),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedValue = boxTokenListrik[selectedIndex][0];
                    });
                  },
                  child: Container(
                    width: 500,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: (selectedIndex == index)
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            boxTokenListrik[index][0],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            boxTokenListrik[index][1],
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            boxTokenListrik[index][2],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
