import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_attributes.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details.dart';

class JadwalPesawat extends StatefulWidget {
  final List<TransportationAttributes> previousData;
  JadwalPesawat({
    Key key,
    List<TransportationAttributes> previousData,
  })  : this.previousData = previousData,
        super(key: key);

  @override
  _JadwalPesawatState createState() => _JadwalPesawatState();
}

class _JadwalPesawatState extends State<JadwalPesawat> {
  List<bool> isSelected = [false, false];

  List _rekomendasi = [
    "Harga Terendah",
    "Keberangkatan Paling Awal",
    "Keberangkatan Paling Akhir",
    "Kedatangan Paling Awal",
    "Kedatangan Paling Akhir",
    "Durasi Tercepat"
  ];

  List _filterButton = ["Langsung", "Gratis Bagasi", "Makanan Gratis"];
  List _cardJadwal = [
    [
      "Japan Airlines",
      "05.00",
      "CGK",
      "10J",
      "Langsung",
      "15.00",
      "DPS",
      "2",
      "315.000",
      "10.000",
      "10.000",
      "10.000"
    ],
    [
      "Bali Airlines",
      "05.00",
      "WWE",
      "1J",
      "Transit",
      "15.00",
      "DPS",
      "4",
      "325.000",
      "12.000",
      "20.000",
      "30.000"
    ],
    [
      "Bali Airlines",
      "05.00",
      "WWE",
      "1J",
      "Transit",
      "15.00",
      "DPS",
      "4",
      "325.000",
      "12.000",
      "20.000",
      "30.000"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jakarta (CGK) > Denpasar - Bali (DPS) ",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("AAAAAAaa",
                    style: TextStyle(fontSize: 13, color: Colors.white))
              ],
            ),
          ],
        ),
      ),
      body: Column(children: [
        Center(
          child: Container(
            height: 60,
            child: Row(
              children: [
                Container(
                  width: 392,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton(
                            onPressed: () {},
                            color: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.grey[300])),
                            child: new Text(
                              '${_filterButton[0]}',
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton(
                            onPressed: () {},
                            color: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.grey[300])),
                            child: new Text(
                              '${_filterButton[1]}',
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey[300])),
                          child: new Text(
                            '${_filterButton[2]}',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _cardJadwal.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ticketDetails(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    width: 1000,
                    height: 215,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors
                            .grey[400], //                   <--- border color
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  child:
                                      Image.asset('images/japan-airlines.png'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  child: Text('${_cardJadwal[index][0]}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 15, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('${_cardJadwal[index][1]}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              )),
                                          Text('${_cardJadwal[index][2]}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.radio_button_unchecked),
                                    Icon(Icons.remove_sharp),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('${_cardJadwal[index][3]}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              )),
                                          Text('${_cardJadwal[index][4]}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[600],
                                              ))
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.remove_sharp),
                                    Icon(Icons.stop_circle),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('${_cardJadwal[index][5]}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              )),
                                          Text('${_cardJadwal[index][6]}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Text(""),
                                  Spacer(),
                                  Text("Rp" + '${_cardJadwal[index][8]}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ))
                                ]),
                                Row(children: <Widget>[
                                  Text("Sisa ${_cardJadwal[index][7]} kursi",
                                      style: TextStyle(
                                        fontSize: 17,
                                      )),
                                  Spacer(),
                                  Text("per orang",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[500],
                                      ))
                                ])
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cashback: ",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text('${_cardJadwal[index][9]}',
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Text("|"),
                              ),
                              Text("Anggota: ",
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              Text('${_cardJadwal[index][10]}',
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Text("|"),
                              ),
                              Text("Retail: ",
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              Text('${_cardJadwal[index][11]}',
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
      floatingActionButton: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child: ToggleButtons(
          color: Colors.black,
          selectedColor: Colors.blue,
          selectedBorderColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.08),
          splashColor: Colors.blue.withOpacity(0.12),
          hoverColor: Colors.blue.withOpacity(0.04),
          borderRadius: BorderRadius.circular(18.0),
          constraints: BoxConstraints(minHeight: 36.0),
          isSelected: isSelected,
          onPressed: (index) {
            switch (index) {
              case 0:
                // showModalBottomSheet(
                //   context: context,
                //   builder: (_) => ModalBottomSheet(),
                // );
                break;
              case 1:
                print("1");
                break;
              default:
                print("Error");
            }
            setState(() {
              isSelected[index] = !isSelected[index];
              if (index == 1) {
                if (isSelected[index - 1] == true) {
                  isSelected[index - 1] = false;
                } else {}
              } else {
                if (isSelected[index + 1] == true) {
                  isSelected[index + 1] = false;
                }
              }
            });
          },
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  child: Row(
                children: [
                  // Image.asset('images/blue_filter_1.png'),
                  Text('Filter'),
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  child: Row(
                children: [
                  // Image.asset('images/blue_filter_1.png'),
                  Text('Tanggal'),
                ],
              )),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
