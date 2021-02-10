import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';

class TabPerjalanan extends StatelessWidget {
  final TransportationModel data;

  const TabPerjalanan({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              leading: Image.asset(
                  '${data.chosenDepartSchedule.iconAirline ?? 'images/japan_airlines.png'}'),
              title: Text(
                '${data.chosenDepartSchedule.airlineName}',
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
                        '${data.chosenDepartSchedule.flightTime}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 2),
            Row(
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
                                '${data.chosenDepartSchedule.depTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${data.chosenDepartSchedule.depCity} (${data.chosenDepartSchedule.depAirportCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  '${data.chosenDepartSchedule.depAirport}'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${data.chosenDepartSchedule.flightTime}',
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
                                '${data.chosenDepartSchedule.arrTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${data.chosenDepartSchedule.arrCity} (${data.chosenDepartSchedule.arrAirportCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  '${data.chosenDepartSchedule.arrAirport}'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (data.isTwoWayTrip)
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: RichText(
                      text: TextSpan(
                        // TODO: masih hardcoding
                        text: '0j 50m  ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'transit di Surabaya (SBY)',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    dense: true,
                    leading: Image.asset(
                        '${data.chosenDepartSchedule.iconAirline ?? 'images/japan_airlines.png'}'),
                    title: Text(
                      '${data.chosenDepartSchedule.airlineName}',
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
                              '${data.chosenDepartSchedule.flightTime}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 2),
                  Row(
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
                                      '${data.chosenReturnSchedule.depTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text('Senin, 12 Jan 2021'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${data.chosenReturnSchedule.depCity} (${data.chosenReturnSchedule.depAirportCode})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        '${data.chosenReturnSchedule.depAirport}'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${data.chosenReturnSchedule.flightTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                      '${data.chosenReturnSchedule.arrTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text('Senin, 12 Jan 2021'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${data.chosenReturnSchedule.arrCity} (${data.chosenReturnSchedule.arrAirportCode})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        '${data.chosenReturnSchedule.arrAirport}'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2),
                ],
              ),
            InkWell(
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
