import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _cabinClass = ['Ekonomi', 'Premium Ekonomi', 'Bisnis', 'First'];

Future kelasKabin(BuildContext context) {
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
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SlideUpMarker(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kelas Kabin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context, _cabinClass[index]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        _cabinClass[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
