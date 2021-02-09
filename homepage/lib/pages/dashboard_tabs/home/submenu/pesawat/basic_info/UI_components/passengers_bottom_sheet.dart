import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future passengersBottomSheet(BuildContext context) {
  List passengerList = [
    ['Dewasa', 0],
    ['Anak', 0],
    ['Bayi', 0],
  ];

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
          builder: (BuildContext context, StateSetter myState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SlideUpMarker(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Jumlah Penumpang",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  for (var element in passengerList)
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            title: Text(
                              '${element[0]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              (element[0] == 'Dewasa')
                                  ? 'Di Atas\n11 Tahun'
                                  : (element[0] == 'Anak')
                                      ? 'Diantara\n2-11 Tahun'
                                      : (element[0] == 'Bayi')
                                          ? 'Di Bawah\n2 Tahun'
                                          : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 100,
                            child: CupertinoPicker.builder(
                              itemExtent: 50,
                              onSelectedItemChanged: (int i) => myState(() {
                                element[1] = i;
                              }),
                              itemBuilder: (context, index) => (index >= 0)
                                  ? Text(
                                      '$index',
                                      style: TextStyle(fontSize: 30),
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: BigButton(
                    title: 'Simpan',
                    onPressed: (passengerList[0][1] == 0 &&
                            passengerList[1][1] == 0 &&
                            passengerList[2][1] == 0)
                        ? null
                        : () {
                            Navigator.pop(context, passengerList);
                          }),
              ),
            ],
          ),
        );
      });
    },
  );
}
