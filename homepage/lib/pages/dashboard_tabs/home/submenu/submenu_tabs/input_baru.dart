import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/card_cashback.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/card_ringkasan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/formfield_nomor.dart';

class InputBaru extends StatefulWidget {
  final String pageName;
  InputBaru({Key key, this.pageName}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  bool rememberMe = false;
  int selectedIndex = 0;
  String selectedValue = '20.000';
  List _boxTokenListrik = [
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
  String _valGender;
  List _listGender = ["Male", "Female"];

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  //============================= main function ===============================
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (widget.pageName == 'Pulsa')
              ? FormFieldNoHandphone()
              : FormFieldNoMeteran(),
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
          (widget.pageName == 'Pulsa')
              ? Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Text(
                          "Nominal Pulsa",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DropdownButton(
                        hint: Text("Select The Gender"),
                        value: _valGender,
                        items: _listGender.map((value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      // Container(
                      //   margin:
                      //       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //   child: ButtonTheme(
                      //     minWidth: 300,
                      //     height: 50,
                      //     child: FlatButton(
                      //       onPressed: () {
                      //         Navigator.of(context).pushNamed('/nominal_pulsa');
                      //       },
                      //       color: Color(0xffDDDDDD),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: new BorderRadius.circular(10.0)),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Container(
                      //             margin: EdgeInsets.only(left: 10),
                      //             child: Text(
                      //               "20.000",
                      //               style: TextStyle(fontSize: 15),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ),
                      //           Container(
                      //             child: Icon(
                      //               Icons.arrow_drop_down,
                      //               color: Theme.of(context).primaryColor,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : nominalTokenListrik(),
          CardRingkasan(pageName: widget.pageName),
          Container(height: 10, color: Colors.grey[300]),
          CardCashback(),
        ],
      ),
    );
  }
  //============================= main function ===============================

  Container nominalTokenListrik() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Nominal Token Listrik",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _boxTokenListrik.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.55),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedValue = _boxTokenListrik[selectedIndex][0];
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
                            _boxTokenListrik[index][0],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _boxTokenListrik[index][1],
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _boxTokenListrik[index][2],
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
