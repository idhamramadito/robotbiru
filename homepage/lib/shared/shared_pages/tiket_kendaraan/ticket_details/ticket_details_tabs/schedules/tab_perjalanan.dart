import 'package:flutter/material.dart';
import 'package:homepage/models/schedule_model.dart';
import 'package:homepage/models/transportation_model.dart';

class TabPerjalanan extends StatelessWidget {
  final ScheduleModel flightSchedule;
  final TransportationModel prevData;
  const TabPerjalanan({
    Key key,
    @required this.flightSchedule,
    @required this.prevData,
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
                  '${flightSchedule.icon ?? 'images/japan_airlines.png'}'),
              title: Text(
                '${flightSchedule.transName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                (prevData.transportationType.contains('Kereta'))
                    ? '${flightSchedule.chairClass}'
                    : 'JT-22',
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
                        '${flightSchedule.tripTime}',
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
                                '${flightSchedule.depTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${flightSchedule.depCity} (${flightSchedule.depCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${flightSchedule.depFullName}'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${flightSchedule.tripTime}',
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
                                '${flightSchedule.arrTime}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '${flightSchedule.arrCity} (${flightSchedule.arrCode})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${flightSchedule.arrFullName}'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (flightSchedule.tripType.contains('Transit'))
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
                  ListTile(
                    dense: true,
                    leading: Image.asset(
                        '${flightSchedule.icon ?? 'images/japan_airlines.png'}'),
                    title: Text(
                      '${flightSchedule.transName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      (prevData.transportationType.contains('Kereta'))
                          ? '${flightSchedule.chairClass}'
                          : 'JT-22',
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
                              '${flightSchedule.tripTime}',
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
                                      '${flightSchedule.depTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text('Senin, 12 Jan 2021'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${flightSchedule.depCity} (${flightSchedule.depCode})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle:
                                        Text('${flightSchedule.depFullName}'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${flightSchedule.tripTime}',
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
                                      '${flightSchedule.arrTime}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text('Senin, 12 Jan 2021'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text(
                                      '${flightSchedule.arrCity} (${flightSchedule.arrCode})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle:
                                        Text('${flightSchedule.arrFullName}'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            if (prevData.transportationType.contains('Pesawat'))
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kebijakan Pembatalan',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
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
