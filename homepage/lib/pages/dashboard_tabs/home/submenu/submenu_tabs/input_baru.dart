import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              ? nominalPulsa(context)
              : nominalTokenListrik(),
          CardRingkasan(pageName: widget.pageName),
          Container(height: 10, color: Colors.grey[300]),
          CardCashback(),
        ],
      ),
    );
  }
  //============================= main function ===============================

  Container nominalPulsa(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Nominal Pulsa",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }

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

class FormFieldNoHandphone extends StatelessWidget {
  const FormFieldNoHandphone({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Masukkan Nomor HP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
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
        ],
      ),
    );
  }
}

class FormFieldNoMeteran extends StatelessWidget {
  const FormFieldNoMeteran({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Masukkan ID Pelanggan / Nomor Meteran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
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
          ),
        ],
      ),
    );
  }
}

class CardRingkasan extends StatefulWidget {
  const CardRingkasan({
    Key key,
    this.pageName,
  }) : super(key: key);
  final String pageName;

  @override
  _CardRingkasanState createState() => _CardRingkasanState();
}

class _CardRingkasanState extends State<CardRingkasan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
            child: Text(
              'Ringkasan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          (widget.pageName == 'Pulsa')
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      Image.asset("images/provider_indosat.png"),
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
                            child: Text("Masa Aktif 40 Hari"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Harga Dasar"), new Text("Rp5800")]),
          ),
        ],
      ),
    );
  }
}

class CardCashback extends StatefulWidget {
  const CardCashback({
    Key key,
  }) : super(key: key);

  @override
  _CardCashbackState createState() => _CardCashbackState();
}

class _CardCashbackState extends State<CardCashback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
            child: Text(
              'Cashback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Pemilik Retail"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Badan Koperasi"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Koperasi"), new Text("Rp5800")]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("Anggota Retail"), new Text("Rp5800")]),
          ),
          Container(height: 15, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
