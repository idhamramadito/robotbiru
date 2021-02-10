import 'package:flutter/material.dart';
import 'package:homepage/models/flight_schedule_model.dart';

List _fasilitas = [
  ['images/koper_biru.png', 'Bagasi'],
  ['images/garpu_biru.png', 'Makanan'],
  ['images/media_biru.png', 'Hiburan'],
  ['images/refundable.png', 'Refundable']
];

class TabFasilitas extends StatelessWidget {
  const TabFasilitas({
    Key key,
    @required this.flightSchedule,
  }) : super(key: key);

  final FlightScheduleModel flightSchedule;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  leading: Image.asset(
                      '${flightSchedule.iconAirline ?? 'images/japan_airlines.png'}'),
                  title: Text(
                    '${flightSchedule.airlineName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    'JT-22',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(child: Image.asset('images/gray_clock.png')),
                        Flexible(
                          child: Text(
                            '${flightSchedule.flightTime}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Bagasi Kabin',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(width: 25),
                      Text(
                        '7Kg', //TODO: masih hardcoding
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fasilitas',
                        style: TextStyle(fontSize: 17),
                      ),
                      Container(
                        width: 250,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _fasilitas.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Image.asset(
                                              _fasilitas[index][0])),
                                      SizedBox(width: 25),
                                      Flexible(
                                        child: Text(
                                          _fasilitas[index][1],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20)
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
