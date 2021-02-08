import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/UI_components/passengers.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/choice_bottom_sheet.dart';
import 'package:homepage/shared/shared_UI_components/date_picker.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/UI_components/basic_info_list_tile.dart';

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
  TransportationModel data = TransportationModel(isTwoWayTrip: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pesawat'),
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
                    name: 'Asal',
                    icon: Icons.flight_takeoff,
                    onPressed: () async {
                      var result = await Navigator.of(context)
                          .pushNamed('/search_page', arguments: 'Asal');
                      setState(() {
                        data.origin = result;
                      });
                    },
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.destination,
                    name: 'Destinasi',
                    icon: Icons.flight_land,
                    onPressed: () async {
                      var result = await Navigator.of(context)
                          .pushNamed('/search_page', arguments: 'Destinasi');
                      setState(() {
                        data.destination = result;
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
                            setState(() {
                              data.dateDepart = result[0];
                              data.dateReturn = result[1];
                            });
                          }
                        : () async {
                            var result = await datePicker(context);
                            setState(() {
                              data.dateDepart = result;
                            });
                          },
                    switchValue: data.isTwoWayTrip,
                    onSwitched: (val) {
                      setState(() {
                        data.isTwoWayTrip = val;
                      });
                    },
                  ),
                  Divider(),
                  Visibility(
                    visible: data.isTwoWayTrip,
                    child: BasicInfoListTile(
                      data: data.dateReturn,
                      name: 'Tanggal Pulang',
                      icon: Icons.calendar_today,
                      onPressed: () async {
                        var result = await dateRangePicker(context);
                        setState(() {
                          data.dateDepart = result[0];
                          data.dateReturn = result[1];
                        });
                      },
                    ),
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.passengers,
                    name: 'Jumlah Penumpang',
                    icon: Icons.person,
                    onPressed: () async {
                      var result = await passengers(context);
                      setState(() {
                        data.passengers = result;
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
                        data.cabinClass = result;
                      });
                    },
                  ),
                  Divider(),
                  BasicInfoListTile(
                    data: data.airline,
                    name: 'Maskapai',
                    icon: Icons.airplanemode_active,
                    onPressed: () async {
                      final result = await Navigator.of(context)
                          .pushNamed('/search_page', arguments: 'Maskapai');
                      setState(() {
                        data.airline = result;
                      });
                    },
                  ),
                  BigButton(
                    title: 'Cari Penerbangan',
                    onPressed: ([
                      data.origin,
                      data.destination,
                      data.dateDepart,
                      data.dateReturn,
                      data.passengers,
                      data.cabinClass,
                      data.airline,
                    ].contains(null))
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
