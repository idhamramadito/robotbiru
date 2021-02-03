import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_attributes.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/UI_components/kelas_kabin.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/UI_components/passengers.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
  bool _isTwoWayTrip = false;
  List<TransportationAttributes> _dataList = [
    TransportationAttributes(
      name: 'Asal',
      icon: Icons.flight_takeoff,
      onPressed: (context) async {
        var result = await Navigator.of(context)
            .pushNamed('/search_page', arguments: 'Asal');
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Destinasi',
      icon: Icons.flight_land,
      onPressed: (context) async {
        var result = await Navigator.of(context)
            .pushNamed('/search_page', arguments: 'Destinasi');
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Tanggal Pergi',
      icon: Icons.calendar_today,
      onPressed: (context) async {
        var result = await displayDateRangePicker(context);
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Tanggal Pulang',
      icon: Icons.calendar_today,
      onPressed: (context) async {
        var result = await displayDateRangePicker(context);
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Jumlah Penumpang',
      icon: Icons.person,
      onPressed: (context) async {
        var result = await passengers(context);
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Kelas Kabin',
      icon: Icons.airline_seat_recline_extra,
      onPressed: (context) async {
        var result = await kelasKabin(context);
        return result;
      },
    ),
    TransportationAttributes(
      name: 'Maskapai',
      icon: Icons.airplanemode_active,
      onPressed: (context) async {
        var result = Navigator.of(context)
            .pushNamed('/search_page', arguments: 'Maskapai');
        return result;
      },
    ),
  ];

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
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _dataList.length,
                    separatorBuilder: (context, index) => Visibility(
                        visible: (_dataList[index].name != 'Tanggal Pulang') ||
                            (_isTwoWayTrip),
                        child: Divider()),
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: (_dataList[index].name != 'Tanggal Pulang') ||
                            (_isTwoWayTrip),
                        child: ListTile(
                          key: UniqueKey(),
                          onTap: () async {
                            final result =
                                await _dataList[index].onPressed(context);
                            setState(() {
                              _dataList[index].content =
                                  result ?? _dataList[index].content;
                              if (_dataList[index].name == 'Tanggal Pergi' &&
                                  !_isTwoWayTrip) {
                                _dataList[index + 1].content =
                                    result ?? _dataList[index + 1].content;
                              }
                            });
                            print('${_dataList[index].content}');
                          },
                          dense: true,
                          leading: Icon(
                            _dataList[index].icon,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            '${_dataList[index].name}' ?? 'Kosong',
                            style: TextStyle(color: Colors.grey),
                          ),
                          subtitle: Text(
                            (_dataList[index].content == null)
                                ? 'Belum Dipilih'
                                : (_dataList[index].name == 'Jumlah Penumpang')
                                    ? '${_dataList[index].content[0][1]} ${_dataList[index].content[0][0]}, ${_dataList[index].content[1][1]} ${_dataList[index].content[1][0]}, ${_dataList[index].content[2][1]} ${_dataList[index].content[2][0]}'
                                    : '${_dataList[index].content}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (_dataList[index].content == null)
                                  ? Colors.grey[300]
                                  : Colors.black,
                            ),
                          ),
                          trailing: Visibility(
                            visible: _dataList[index].name == 'Tanggal Pergi',
                            child: Switch(
                              value: _isTwoWayTrip,
                              onChanged: (val) {
                                setState(() {
                                  _isTwoWayTrip = val;
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  BigButton(
                    title: 'Cari Penerbangan',
                    onPressed:
                        (_dataList.any((element) => element.content == null))
                            ? null
                            : () {
                                Navigator.of(context).pushNamed(
                                  '/jadwal_pesawat',
                                  arguments: _dataList,
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

Future displayDateRangePicker(BuildContext context) async {
  final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime.now().add(Duration(days: 2)),
      firstDate: new DateTime(DateTime.now().year - 50),
      lastDate: new DateTime(DateTime.now().year + 50));
  if (picked != null && picked.length == 1) {
    return picked[0];
  } else if (picked != null && picked.length == 2) {
    return picked;
  }
}
