import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

List _cabinClass = [
  ['Ekonomi', '', false],
  ['Premium Ekonomi', '', false],
  ['Bisnis', '', false],
  ['First', '', false],
];
List _hargaBagasi = [
  ["0kg", "(+Rp 0)", false],
  ["5kg", "(+Rp 165.000)", false],
  ["10kg", "(+Rp 330.000)", false],
  ["15kg", "(+Rp 495.000)", false],
];

Future choiceBottomSheet(BuildContext context, String pageName) {
  List _sementara;
  switch (pageName) {
    case 'Kelas Kabin':
      _sementara = List.from(_cabinClass);
      break;
    case 'Bagasi':
      _sementara = List.from(_hargaBagasi);
      break;
    default:
  }
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
                        pageName,
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
                      itemCount: _sementara.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${_sementara[index][0]} ${_sementara[index][1] ?? ''}',
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: Visibility(
                              visible: (_sementara[index][2] == true),
                              child: Icon(Icons.check_sharp),
                            ),
                            onTap: () {
                              mystate(() {
                                for (var item in _sementara) item[2] = false;
                                _sementara[index][2] = true;
                                switch (pageName) {
                                  case 'Kelas Kabin':
                                    _cabinClass = List.from(_sementara);
                                    break;
                                  case 'Bagasi':
                                    _hargaBagasi = List.from(_sementara);
                                    break;
                                  default:
                                }
                              });
                              Navigator.pop(context, _sementara[index][0]);
                            });
                      }),
                ),
              ],
            ),
          );
        });
      });
}
