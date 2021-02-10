import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future passengersBottomSheet(BuildContext context) {
  List<NameAndContent> passengerList = [
    NameAndContent(name: 'Dewasa', content: 0),
    NameAndContent(name: 'Anak', content: 0),
    NameAndContent(name: 'Bayi', content: 0),
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
                              '${element.name}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              (element.name == 'Dewasa')
                                  ? 'Di Atas\n11 Tahun'
                                  : (element.name == 'Anak')
                                      ? 'Diantara\n2-11 Tahun'
                                      : (element.name == 'Bayi')
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
                                element.content = i;
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
                  onPressed: (passengerList[0].content > 0)
                      ? () => Navigator.pop(context, passengerList)
                      : null,
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
