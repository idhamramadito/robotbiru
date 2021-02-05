import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _hargaBagasi = [
  ["0kg (+Rp 0)", false],
  ["5kg (+Rp 165.000)", false],
  ["10kg (+Rp 330.000)", false],
  ["15kg (+Rp 495.000)", false],
];
String number;
int selectedIndex;

Future bagasiBottomSheet(BuildContext context) {
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
          return SingleChildScrollView(
            child: Column(
              children: [
                SlideUpMarker(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bagasi Pergi Tambahan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _hargaBagasi.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          child: Text(
                                            _hargaBagasi[index][0],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Visibility(
                                          visible: (selectedIndex == index),
                                          child: Icon(Icons.check_sharp),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      mystate(() {
                                        selectedIndex = index;
                                      });
                                      number = _hargaBagasi[index][0];
                                      Navigator.pop(context, number);
                                    }),
                              ),
                              Divider(),
                            ],
                          );
                        })),
              ],
            ),
          );
        });
      });
}
