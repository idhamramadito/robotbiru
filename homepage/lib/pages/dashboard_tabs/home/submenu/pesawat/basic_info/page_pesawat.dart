import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/basic_info/UI_components/basic_info_list_tile.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/basic_info/UI_components/passengers_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/choice_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/date_picker.dart';

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
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
                  (data.transportationType.contains('Pesawat'))
                      ? BasicInfoListTile(
                          data: data.origin,
                          name: 'Bandara Asal',
                          icon: Icons.flight_takeoff,
                          onPressed: () async {
                            var result = await Navigator.of(context).pushNamed(
                                '/search_page',
                                arguments: 'Bandara Asal');
                            setState(() {
                              data.origin = result ?? data.origin;
                            });
                          },
                        )
                      : (data.transportationType.contains('Kereta'))
                          ? BasicInfoListTile(
                              data: data.origin,
                              name: 'Stasiun Asal',
                              icon: Icons.train,
                              onPressed: () async {
                                var result = await Navigator.of(context)
                                    .pushNamed('/search_page',
                                        arguments: 'Stasiun Asal');
                                setState(() {
                                  data.origin = result ?? data.origin;
                                });
                              },
                            )
                          : Container(),
                  Divider(),
                  (data.transportationType.contains('Pesawat'))
                      ? BasicInfoListTile(
                          data: data.destination,
                          name: 'Bandara Destinasi',
                          icon: Icons.flight_land,
                          onPressed: () async {
                            var result = await Navigator.of(context).pushNamed(
                                '/search_page',
                                arguments: 'Bandara Destinasi');
                            setState(() {
                              data.destination = result ?? data.destination;
                            });
                          },
                        )
                      : (data.transportationType.contains('Kereta'))
                          ? BasicInfoListTile(
                              data: data.destination,
                              name: 'Stasiun Destinasi',
                              icon: Icons.train,
                              onPressed: () async {
                                var result = await Navigator.of(context)
                                    .pushNamed('/search_page',
                                        arguments: 'Stasiun Destinasi');
                                setState(() {
                                  data.destination = result ?? data.destination;
                                });
                              },
                            )
                          : Container(),
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
                  ListTile(
                    dense: true,
                    title: Text(
                      'Pulang Pergi?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Switch(
                      value: data.isTwoWayTrip,
                      onChanged: (val) {
                        setState(() {
                          data.isTwoWayTrip = val ?? data.isTwoWayTrip;
                          if (val == false) data.dateReturn = null;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: data.isTwoWayTrip,
                    child: BasicInfoListTile(
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
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.passengers,
                    name: 'Jumlah Penumpang',
                    icon: Icons.person,
                    onPressed: () async {
                      var result = await passengersBottomSheet(context);
                      setState(() {
                        data.passengers = result ?? data.passengers;
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
                  Visibility(
                    visible: data.transportationType.contains('Pesawat'),
                    child: BasicInfoListTile(
                      data: data.airline,
                      name: 'Maskapai',
                      icon: Icons.airplanemode_active,
                      onPressed: () async {
                        final result = await Navigator.of(context)
                            .pushNamed('/search_page', arguments: 'Maskapai');
                        setState(() {
                          data.airline = result ?? data.airline;
                        });
                      },
                    ),
                  ),
                  data.transportationType.contains('Pesawat')
                      ? BigButton(
                          title: 'Cari Penerbangan',
                          onPressed: ([
                                    data.origin,
                                    data.destination,
                                    data.dateDepart,
                                    data.passengers,
                                    data.cabinClass,
                                    data.airline,
                                  ].contains(null) ||
                                  (data.isTwoWayTrip == true &&
                                      data.dateReturn == null))
                              ? null
                              : () {
                                  Navigator.of(context).pushNamed(
                                    '/jadwal_pesawat',
                                    arguments: data,
                                  );
                                },
                        )
                      : (data.transportationType.contains('Kereta'))
                          ? BigButton(
                              title: 'Cari Kereta',
                              onPressed: ([
                                        data.origin,
                                        data.destination,
                                        data.dateDepart,
                                        data.passengers,
                                        data.cabinClass,
                                      ].contains(null) ||
                                      (data.isTwoWayTrip == true &&
                                          data.dateReturn == null))
                                  ? null
                                  : () {
                                      Navigator.of(context).pushNamed(
                                        '/jadwal_kereta',
                                        arguments: data,
                                      );
                                    },
                            )
                          : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
