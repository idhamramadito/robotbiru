import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

class Bagasi extends StatefulWidget {
  @override
  _BagasiState createState() => _BagasiState();
}

List _hargaBagasi = [
  ["0kg (+Rp 0)", false],
  ["5kg (+Rp 165.000)", false],
  ["10kg (+Rp 330.000)", false],
  ["15kg (+Rp 495.000)", false],
];
int selectedIndex;

class _BagasiState extends State<Bagasi> {
  String number;
  @override
  void initState() {
    super.initState();
    number = number ?? "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bagasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penumpang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Tuan Anbiya Nur Rohmat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pergi: ${number}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Penerbangan Pergi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/japan-airlines.png',
                        width: 50,
                      ),
                      Text(
                        'CGK - DPS',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Kamu punya bagasi gratis 20kg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bagasi Pergi Tambahan',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              number,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 20.0,
                              color: Colors.brown[900],
                            ),
                          ],
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter mystate) {
                                  return DraggableScrollableSheet(
                                    expand: false,
                                    builder: (context, controller) {
                                      return SingleChildScrollView(
                                        controller: controller,
                                        child: Column(
                                          children: [
                                            SlideUpMarker(),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 25),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Bagasi Pergi Tambahan",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 25),
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        _hargaBagasi.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child: InkWell(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              0,
                                                                          vertical:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        _hargaBagasi[index]
                                                                            [0],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    Visibility(
                                                                      visible: selectedIndex ==
                                                                              index
                                                                          ? true
                                                                          : false,
                                                                      child: Icon(
                                                                          Icons
                                                                              .check_sharp),
                                                                    ),
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  mystate(() {
                                                                    selectedIndex =
                                                                        index;
                                                                  });
                                                                  setState(() {
                                                                    number =
                                                                        _hargaBagasi[index]
                                                                            [0];
                                                                  });
                                                                }),
                                                          ),
                                                          Divider(),
                                                        ],
                                                      );
                                                    })),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                });
                              });
                        }),
                  ),
                  Text(
                    'Untuk keberangkatan kurang dari 6 jam, Anda dapat membeli bagasi di bandara.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 307.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "per orang",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: BigButton(
                title: 'Pesan Pesawat',
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamed('/pemesanan', arguments: [
                  //   customerData,
                  //   flightData,
                  // ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
