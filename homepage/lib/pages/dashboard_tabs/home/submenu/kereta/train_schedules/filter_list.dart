import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _waktuPergi = [
  ["00:00 - 06:00", false],
  ["06:00 - 12:00", false],
  ["12:00 - 18:00", false],
  ["18:00 - 24:00", false],
];

List _waktuTiba = [
  ["00:00 - 06:00", false],
  ["06:00 - 12:00", false],
  ["12:00 - 18:00", false],
  ["18:00 - 24:00", false],
];
List _kelas = [
  ["Ekonomi", false],
  ["Eksekutif", false],
  ["First Class", false],
];
List _namaKereta = [
  ["Argo Parahyangan", false],
  ["Serayu", false],
  ["Thomas", false],
];

List _urutkanDengan = [
  "Harga Terendah",
  "Keberangkatan Paling Awal",
  "Keberangkatan Paling Akhir",
  "Kedatangan Paling Awal",
  "Kedatangan Paling Akhir",
  "Durasi Tercepat",
];
bool isPressed = false;
int selectedValue;
String temp = _urutkanDengan[1];

Future filterList(BuildContext context) {
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
            initialChildSize: 0.9,
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Urutkan",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _urutkanDengan.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Text(
                                      _urutkanDengan[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: temp == _urutkanDengan[index]
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                  Radio(
                                    value: _urutkanDengan[index],
                                    groupValue: temp,
                                    onChanged: (value) {
                                      mystate(() {
                                        temp = value;
                                      });
                                    },
                                  ),
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
                            "Filter",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu Pergi",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _waktuPergi.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _waktuPergi[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Checkbox(
                                      value: _waktuPergi[index][1],
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        mystate(() {
                                          _waktuPergi[index][1] = value;
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
                            "Waktu Tiba",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _waktuTiba.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _waktuTiba[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Checkbox(
                                      value: _waktuTiba[index][1],
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        mystate(() {
                                          _waktuTiba[index][1] = value;
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
                            "Kelas",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _kelas.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _kelas[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Checkbox(
                                      value: _kelas[index][1],
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        mystate(() {
                                          _kelas[index][1] = value;
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
                            "Nama Kereta",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _namaKereta.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _namaKereta[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Checkbox(
                                      value: _namaKereta[index][1],
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (value) {
                                        mystate(() {
                                          _namaKereta[index][1] = value;
                                        });
                                      }),
                                ],
                              ));
                        }),
                  ],
                ),
              );
            },
          );
        });
      });
}
