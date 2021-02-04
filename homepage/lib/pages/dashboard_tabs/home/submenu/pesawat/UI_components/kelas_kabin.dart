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
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, controller) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            child: Column(
              children: [
                SlideUpMarker(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kelas Kabin',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                  ],
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  _cabinClass[index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context, _cabinClass[index]);
                          },
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          );
        },
      );
    },
  );
}
