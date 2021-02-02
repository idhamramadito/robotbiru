import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_attributes.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/kelas_kabin.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/passengers.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
  bool _isTwoWayTrip = false;

  @override
  Widget build(BuildContext context) {
    List<TransportationAttributes> _dataList = [
      TransportationAttributes(
        name: 'Asal',
        icon: Icons.flight_takeoff,
        onPressed: () {
          Navigator.of(context).pushNamed('/search_page', arguments: 'Asal');
        },
      ),
      TransportationAttributes(
        name: 'Destinasi',
        icon: Icons.flight_land,
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/search_page', arguments: 'Destinasi');
        },
      ),
      TransportationAttributes(
        name: 'Tanggal Pergi',
        icon: Icons.calendar_today,
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/date_page', arguments: 'Tanggal Pergi');
        },
      ),
      TransportationAttributes(
        name: 'Tanggal Pulang',
        icon: Icons.calendar_today,
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/date_page', arguments: 'Tanggal Pulang');
        },
      ),
      TransportationAttributes(
        name: 'Jumlah Penumpang',
        icon: Icons.person,
        onPressed: () {
          passengers(context);
        },
      ),
      TransportationAttributes(
        name: 'Kelas Kabin',
        icon: Icons.airline_seat_recline_extra,
        onPressed: () async {
          var result = await kelasKabin(context);
          return result;
        },
      ),
      TransportationAttributes(
        name: 'Maskapai',
        icon: Icons.airplanemode_active,
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/search_page', arguments: 'Maskapai');
        },
      ),
    ];

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
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: (_dataList[index].name != 'Tanggal Pulang') ||
                            (_isTwoWayTrip),
                        child: ListTile(
                          key: UniqueKey(),
                          onTap: () async {
                            final result = await _dataList[index].onPressed();
                            setState(() {
                              _dataList[index].content = result;
                            });
                            print(_dataList[index].content);
                          },
                          dense: true,
                          leading: Icon(
                            _dataList[index].icon,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            _dataList[index].name ?? 'Kosong',
                            style: TextStyle(color: Colors.grey),
                          ),
                          subtitle: Text(
                            _dataList[index].content ?? 'Belum Dipilih',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/jadwal_pesawat');
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
