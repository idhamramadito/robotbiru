import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future ticketDetails(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SlideUpMarker(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Detail Tiket',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Perjalanan"),
                  Tab(text: "Fasilitas"),
                  Tab(text: "Harga"),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
