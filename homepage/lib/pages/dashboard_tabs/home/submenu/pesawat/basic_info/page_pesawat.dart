import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/basic_info/UI_components/basic_info_list_tile.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/basic_info/UI_components/passengers_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/choice_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/date_picker.dart';
import 'package:homepage/shared/shared_pages/search_page.dart';

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
  List _bandara = [
    ['images/gedung.png', 'Jakarta', 'Semua Bandara', 'JKTC'],
    ['images/gedung.png', 'Surabaya', 'Semua Bandara', 'SBYC'],
    ['images/gedung.png', 'Medan', 'Semua Bandara', 'MESC'],
  ];

  List _maskapai = [
    ['images/pesawat_kecil.png', 'American Airlines', '', ''],
    ['images/pesawat_kecil.png', 'AirAsia Malaysia', '', ''],
    ['images/pesawat_kecil.png', 'Garuda Indonesia', '', ''],
  ];

  TransportationModel data = TransportationModel(
    transportationType: 'Pesawat',
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
                    name: 'Bandara Asal',
                    icon: Icons.flight_takeoff,
                    onPressed: () async {
                      var result =
                          await Navigator.of(context).pushNamed('/search_page',
                              arguments: SearchPage(
                                pageName: 'Bandara Asal',
                                dataList: _bandara,
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
                    name: 'Bandara Destinasi',
                    icon: Icons.flight_land,
                    onPressed: () async {
                      var result =
                          await Navigator.of(context).pushNamed('/search_page',
                              arguments: SearchPage(
                                pageName: 'Bandara Destinasi',
                                dataList: _bandara,
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
                      var result = await passengersBottomSheet(context);
                      setState(() {
                        data.passengersAmount = result ?? data.passengersAmount;
                      });
                    },
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.cabinClass,
                    name: 'Kelas Kabin',
                    icon: Icons.airline_seat_recline_extra,
                    onPressed: () async {
                      var result =
                          await choiceBottomSheet(context, "Kelas Kabin");
                      setState(() {
                        data.cabinClass = result ?? data.cabinClass;
                      });
                    },
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.airline,
                    name: 'Maskapai',
                    icon: Icons.airplanemode_active,
                    onPressed: () async {
                      final result =
                          await Navigator.of(context).pushNamed('/search_page',
                              arguments: SearchPage(
                                pageName: 'Maskapai',
                                dataList: _maskapai,
                              ));
                      setState(() {
                        data.airline = result ?? data.airline;
                      });
                    },
                  ),
                  BigButton(
                    title: 'Cari Penerbangan',
                    onPressed: ([
                              data.origin,
                              data.destination,
                              data.dateDepart,
                              data.passengersAmount,
                              data.cabinClass,
                              data.airline,
                            ].contains(null) ||
                            (data.passengersAmount[0][1] <= 0) ||
                            (data.isTwoWayTrip == true &&
                                data.dateReturn == null))
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(
                              '/jadwal_pesawat',
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
