import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _rekomendasi = [
  "Harga Terendah",
  "Keberangkatan Paling Awal",
  "Keberangkatan Paling Akhir",
  "Kedatangan Paling Awal",
  "Kedatangan Paling Akhir",
  "Durasi Tercepat"
];
List _filterDengan = [
  ["Langsung", false],
  ["1 Transit", false],
  ["2 Transit", false],
];
List _filterWaktu = [
  ["00:00 - 06:00", false],
  ["06:00 - 12:00", false],
  ["12:00 - 18:00", false],
];
List _filterFasiitas = [
  ["Bagasi", false],
  ["Makanan", false],
  ["Wi-Fi", false],
  ["Hiburan", false],
  ["USB", false],
];
Future bottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    SlideUpMarker(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Urutkan dan Filter",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Urutkan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _rekomendasi.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: InkWell(
                                        child: Text(
                                          _rekomendasi[index],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            })),
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: Divider()),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Filter Dengan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Durasi Transit",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filterDengan.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _filterDengan[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Checkbox(
                                      value: _filterDengan[index][1],
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        mystate(() {
                                          _filterDengan[index][1] = value;
                                        });
                                      }),
                                ],
                              ));
                        }),
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: Divider()),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu Transit",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filterWaktu.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _filterWaktu[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Checkbox(
                                      value: _filterWaktu[index][1],
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        mystate(() {
                                          _filterDengan[index][1] = value;
                                        });
                                      }),
                                ],
                              ));
                        }),
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: Divider()),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Fasilitas",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _filterFasiitas.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _filterFasiitas[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Checkbox(
                                      value: _filterFasiitas[index][1],
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        mystate(() {
                                          _filterFasiitas[index][1] = value;
                                        });
                                      }),
                                ],
                              ));
                        })
                  ],
                ),
              );
            },
          );
        });
      });
}
