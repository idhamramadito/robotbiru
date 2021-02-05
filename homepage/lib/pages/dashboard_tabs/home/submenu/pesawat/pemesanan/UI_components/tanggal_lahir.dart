import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future tanggalLahir(BuildContext context) {
  DateTime result;

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
      return SingleChildScrollView(
        child: Column(
          children: [
            SlideUpMarker(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Tanggal Lahir",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 100,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  result = newDate;
                },
                minimumYear: 1900,
                maximumYear: 2021,
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: BigButton(
                title: 'Simpan',
                onPressed: () {
                  Navigator.pop(context, result);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
