import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';

class PergiTab extends StatelessWidget {
  final TransportationModel prevData;
  const PergiTab({
    Key key,
    this.prevData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              dense: true,
              leading: Image.asset(
                  '${prevData.chosenDepartSchedule.iconAirline ?? 'images/japan_airlines.png'}'),
              title: Text(
                '${prevData.chosenDepartSchedule.airlineName}',
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
                        '${prevData.chosenDepartSchedule.flightTime}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/origin_to_destination.png',
                    height: 200,
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${prevData.chosenDepartSchedule.depTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${prevData.chosenDepartSchedule.depCity} (${prevData.chosenDepartSchedule.depAirportCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  '${prevData.chosenDepartSchedule.depAirport}'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${prevData.chosenDepartSchedule.flightTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Langsung'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${prevData.chosenDepartSchedule.arrTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${prevData.chosenDepartSchedule.arrCity} (${prevData.chosenDepartSchedule.arrAirportCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  '${prevData.chosenDepartSchedule.arrAirport}'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kebijakan Pembatalan',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/kebijakan_pembatalan');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Penumpang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 2),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1. Tuan Anbiya Nur Rohmat',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 27,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Text(
                            "Dewasa",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'CGK - DPS',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('images/koper_biru.png'),
                                    Text(' Bagasi 20Kg'),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset('images/garpu_biru.png'),
                                    Text(' Makanan'),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('images/media_biru.png'),
                                    Text(' Hiburan'),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset('images/refundable.png'),
                                    Text(' Refundable'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
