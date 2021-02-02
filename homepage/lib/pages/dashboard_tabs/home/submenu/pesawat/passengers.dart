import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future passengers(BuildContext context) {
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
                  Center(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
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
                      print(index);
                    },
                    children: <Widget>[
                      Text("Item 1"),
                      Text("Item 2"),
                      Text("Item 3"),
                      Text("Item 4"),
                    ],
                  )
                ],
              ),
            );
          });
    },
  );
}
