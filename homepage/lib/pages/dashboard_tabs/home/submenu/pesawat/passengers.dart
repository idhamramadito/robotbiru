import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future passengers(BuildContext context) {
  List passengerList = [0, 0, 0];

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
      return DraggableScrollableSheet(
          expand: false,
          builder: (context, controller) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              child: Column(
                children: [
                  SlideUpMarker(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      "Jumlah Penumpang",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20),
                    childAspectRatio: 1.5,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: [
                      ListTile(
                          dense: true,
                          title: Text(
                            "Dewasa",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Diatas\n11 Tahun",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          )),
                      ListTile(
                          dense: true,
                          title: Text(
                            "Anak",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Diantara\n2-11 Tahun",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          )),
                      ListTile(
                          dense: true,
                          title: Text(
                            "Bayi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Dibawah\n2 Tahun",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          )),
                    ],
                  ),
                  CupertinoPicker(
                    itemExtent: 50,
                    onSelectedItemChanged: (int index) {
                      passengerList[0] = index;
                    },
                    children: <Widget>[
                      Text("0"),
                      Text("1"),
                      Text("2"),
                      Text("3"),
                      Text("4"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BigButton(
                      title: 'Simpan',
                      onPressed: () {
                        Navigator.pop(context, passengerList[0].toString());
                      },
                    ),
                  ),
                ],
              ),
            );
          });
    },
  );
}
