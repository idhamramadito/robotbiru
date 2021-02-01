import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class PagePesawat extends StatefulWidget {
  @override
  _PagePesawatState createState() => _PagePesawatState();
}

class _PagePesawatState extends State<PagePesawat> {
  List _dataList = [
    ['Dari', Icons.flight_takeoff, 'Jakarta (JKTC)', '/search_page'],
    ['Ke', Icons.flight_land, 'Denpasar-Bali (DPS)', '/search_page'],
    ['Pergi', Icons.calendar_today, 'Senin, 18 Januari 2021', '/date_page'],
    ['Pulang', Icons.calendar_today, 'Senin, 22 Januari 2021', '/date_page'],
    ['Penumpang', Icons.person, '1 Dewasa, 1 Anak', '/passengers'],
    [
      'Kelas Kabin',
      Icons.airline_seat_recline_extra,
      'Ekonomi',
      '/cabin_class'
    ],
    ['Maskapai', Icons.airplanemode_active, 'Garuda Indonesia', '/search_page'],
  ];
  bool _isTwoWayTrip = false;

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
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(thickness: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return Visibility(
                        visible: (_dataList[index][0] != 'Pulang') ||
                            (_isTwoWayTrip),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(_dataList[index][3]);
                          },
                          child: ListTile(
                            dense: true,
                            leading: Icon(
                              _dataList[index][1],
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              _dataList[index][0],
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              _dataList[index][2],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Visibility(
                              visible: _dataList[index][0] == 'Pergi',
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
                        ),
                      );
                    },
                  ),
                  BigButton(
                    title: 'Cari Penerbangan',
                    onPressed: () {},
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
