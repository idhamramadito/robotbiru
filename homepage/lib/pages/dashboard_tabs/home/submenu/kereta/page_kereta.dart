import 'package:flutter/material.dart';
import 'package:homepage/models/passenggers_model.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/UI_components/basic_info_list_tile.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/UI_components/passengers_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/choice_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/date_picker.dart';
import 'package:homepage/shared/shared_pages/search_page.dart';

class PageKereta extends StatefulWidget {
  @override
  _PageKeretaState createState() => _PageKeretaState();
}

class _PageKeretaState extends State<PageKereta> {
  List _stasiun = [
    ['images/stasiun_blue-01.png', 'Stasiun Gambir', 'Jakarta', 'GMR'],
    ['images/stasiun_blue-01.png', 'Stasiun Bandung', 'Bandung', 'BD'],
    ['images/stasiun_blue-01.png', 'Stasiun Kiaracondong', 'Bandung', 'KAC'],
  ];

  TransportationModel data = TransportationModel(
    transportationType: 'Kereta',
    isTwoWayTrip: false,
  ); // sisanya masih null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('${data.transportationType}'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  BasicInfoListTile(
                    data: data.origin,
                    name: 'Stasiun Keberangkatan',
                    icon: Icons.train,
                    onPressed: () async {
                      var result =
                          await Navigator.of(context).pushNamed('/search_page',
                              arguments: SearchPage(
                                pageName: 'Stasiun Keberangkatan',
                                dataList: _stasiun,
                              ));
                      setState(() {
                        data.origin = result ?? data.origin;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            String temp = data.origin;
                            data.origin = data.destination;
                            data.destination = temp;
                          });
                        },
                        color: Colors.white,
                        textColor: Colors.blue,
                        child: Icon(Icons.sync),
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                  BasicInfoListTile(
                    data: data.destination,
                    name: 'Stasiun Tujuan',
                    icon: Icons.train,
                    onPressed: () async {
                      var result =
                          await Navigator.of(context).pushNamed('/search_page',
                              arguments: SearchPage(
                                pageName: 'Stasiun Tujuan',
                                dataList: _stasiun,
                              ));
                      setState(() {
                        data.destination = result ?? data.destination;
                      });
                    },
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.dateDepart,
                    name: 'Tanggal Pergi',
                    icon: Icons.calendar_today,
                    onPressed: (data.isTwoWayTrip)
                        ? () async {
                            var result = await dateRangePicker(context);
                            if (result != null) {
                              setState(() {
                                data.dateDepart = result[0] ?? data.dateDepart;
                                data.dateReturn = result[1] ?? data.dateReturn;
                              });
                            }
                          }
                        : () async {
                            var result = await datePicker(context);
                            setState(() {
                              data.dateDepart = result ?? data.dateDepart;
                            });
                          },
                  ),
                  Divider(),
                  SwitchListTile(
                    dense: true,
                    title: Text(
                      'Pulang Pergi?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    value: data.isTwoWayTrip,
                    onChanged: (val) {
                      setState(() {
                        data.isTwoWayTrip = val ?? data.isTwoWayTrip;
                        if (val == false) data.dateReturn = null;
                      });
                    },
                  ),
                  if (data.isTwoWayTrip)
                    BasicInfoListTile(
                      data: data.dateReturn,
                      name: 'Tanggal Pulang',
                      icon: Icons.calendar_today,
                      onPressed: () async {
                        var result = await dateRangePicker(context);
                        if (result != null) {
                          setState(() {
                            data.dateDepart = result[0] ?? data.dateDepart;
                            data.dateReturn = result[1] ?? data.dateReturn;
                          });
                        }
                      },
                    ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.passengersAmount,
                    name: 'Jumlah Penumpang',
                    icon: Icons.person,
                    onPressed: () async {
                      List _temp = [];
                      var result = await passengersBottomSheet(context);
                      setState(() {
                        data.passengersAmount = result ?? data.passengersAmount;
                        for (int i = 0; i < data.passengersAmount.length; i++) {
                          if (data.passengersAmount[i].content > 0) {
                            for (int j = 0;
                                j < data.passengersAmount[i].content;
                                j++) {
                              _temp.add(PassengersModel(
                                  ageType: data.passengersAmount[i].name));
                            }
                          }
                        }
                        data.passengersDetails =
                            List.from(_temp) ?? data.passengersDetails;
                      });
                    },
                  ),
                  BigButton(
                    title: 'Cari Kereta',
                    onPressed: ([
                              data.origin,
                              data.destination,
                              data.dateDepart,
                              data.passengersAmount,
                              data.cabinClass,
                            ].contains(null) ||
                            (data.isTwoWayTrip == true &&
                                data.dateReturn == null))
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(
                              '/list_jadwal_kendaraan',
                              arguments: data,
                            );
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
