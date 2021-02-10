import 'package:flutter/material.dart';
import 'package:homepage/models/flight_schedule_model.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/ticket_details/ticket_details.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key key,
    @required this.flightSchedule,
    this.previousData,
    this.onTap,
  }) : super(key: key);

  final FlightScheduleModel flightSchedule;
  final TransportationModel previousData;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          width: 1000,
          height: 215,
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.grey[400], //                   <--- border color
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      leading: Image.asset(flightSchedule.iconAirline),
                      title: Text('${flightSchedule.airlineName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          ticketDetails(context, 'Jadwal Pesawat',
                              flightSchedule, previousData);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${flightSchedule.depTime}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                Text('${flightSchedule.depAirportCode}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                          Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.remove_sharp,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${flightSchedule.flightTime}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                Text('${flightSchedule.flightType}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                    ))
                              ],
                            ),
                          ),
                          Icon(
                            Icons.remove_sharp,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.stop_circle,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${flightSchedule.arrTime}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                                Text('${flightSchedule.arrAirportCode}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Spacer(),
                        Text(
                            '${NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(flightSchedule.ticketPrice)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ))
                      ]),
                      Row(children: <Widget>[
                        Icon(Icons.airline_seat_recline_extra,
                            color: Colors.blue),
                        SizedBox(
                          width: 1,
                        ),
                        Text(
                            previousData.transportationType == 'Pesawat'
                                ? "Sisa ${flightSchedule.chairLeft} kursi"
                                : flightSchedule.chairClass,
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        Spacer(),
                        Text("per orang",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ))
                      ])
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cashback: ",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    Text(
                        '${NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(flightSchedule.cashback)}',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Text("|"),
                    ),
                    Text("Anggota: ",
                        style: TextStyle(
                          fontSize: 11,
                        )),
                    Text(
                        '${NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(flightSchedule.anggota)}',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Text("|"),
                    ),
                    Text("Retail: ",
                        style: TextStyle(
                          fontSize: 11,
                        )),
                    Text(
                        '${NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(flightSchedule.retail)}',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
