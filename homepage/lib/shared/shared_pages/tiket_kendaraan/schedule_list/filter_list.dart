import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _urutan = [
  ["Harga Terendah", false],
  ["Keberangkatan Paling Awal", false],
  ["Keberangkatan Paling Akhir", false],
  ["Kedatangan Paling Awal", false],
  ["Kedatangan Paling Akhir", true],
  ["Durasi Tercepat", false],
];

List _filterDengan = [
  ["Langsung", false],
  ["1 Transit", false],
  ["2 Transit", false],
];

List _filterFasiitas = [
  ["Bagasi", false],
  ["Makanan", false],
  ["Wi-Fi", false],
  ["Hiburan", false],
  ["USB", false],
];

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

bool isPressed = false;
int selectedValue;

Future filterList(BuildContext context, TransportationModel previousData) {
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SlideUpMarker(),
                      Text(
                        "Urutkan dan Filter",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ExpansionTile(
                        expandedAlignment: Alignment.centerLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: Text(
                          'Urutkan',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _urutan.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true,
                                title: Text(
                                  _urutan[index][0],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: selectedValue == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  mystate(() {
                                    selectedValue = index;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Filter Dengan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Divider(height: 20, thickness: 2),
                      Text(
                        "Durasi Transit",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _filterDengan.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    _filterDengan[index][0],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: isPressed
                                          ? Theme.of(context).primaryColor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                    value: _filterDengan[index][1],
                                    activeColor: Theme.of(context).primaryColor,
                                    onChanged: (value) {
                                      mystate(() {
                                        _filterDengan[index][1] = value;
                                      });
                                    }),
                              ],
                            );
                          }),
                      Divider(height: 20, thickness: 2),
                      Text(
                        "Waktu Pergi",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _waktuPergi.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _waktuPergi[index][0],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Checkbox(
                                  value: _waktuPergi[index][1],
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    mystate(() {
                                      _waktuPergi[index][1] = value;
                                    });
                                  }),
                            ],
                          );
                        },
                      ),
                      Divider(height: 20, thickness: 2),
                      Text(
                        "Waktu Tiba",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _waktuTiba.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _waktuTiba[index][0],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Checkbox(
                                  value: _waktuTiba[index][1],
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    mystate(() {
                                      _waktuTiba[index][1] = value;
                                    });
                                  }),
                            ],
                          );
                        },
                      ),
                      if (previousData.transportationType.contains('Pesawat'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(height: 20, thickness: 2),
                            Text(
                              "Fasilitas",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: _filterFasiitas.length,
                                itemBuilder: (context, index) {
                                  return Row(
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
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          onChanged: (value) {
                                            mystate(() {
                                              _filterFasiitas[index][1] = value;
                                            });
                                          }),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      if (previousData.transportationType.contains('Kereta'))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(height: 20, thickness: 2),
                            Text(
                              "Kelas",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: _kelas.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _kelas[index][0],
                                        style: TextStyle(
                                          fontSize: 15,
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
                                  );
                                }),
                            Divider(height: 20, thickness: 2),
                            Text(
                              "Nama Kereta",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: _namaKereta.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _namaKereta[index][0],
                                        style: TextStyle(
                                          fontSize: 15,
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
                                  );
                                }),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        });
      });
}
