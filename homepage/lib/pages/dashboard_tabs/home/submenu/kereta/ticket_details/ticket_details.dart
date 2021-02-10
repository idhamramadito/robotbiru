import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/models/flight_schedule_model.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/ticket_details/ticket_details_tabs/flight_schedules/tab_fasilitas.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/ticket_details/ticket_details_tabs/flight_schedules/tab_harga.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/ticket_details/ticket_details_tabs/flight_schedules/tab_perjalanan.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future ticketDetails(BuildContext context, String sourcePage,
    FlightScheduleModel flightSchedule, TransportationModel data) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return DefaultTabController(
        length: 3,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SlideUpMarker(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  'Detail Tiket',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '${flightSchedule.depAirportCode}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text('${flightSchedule.depCity}'),
                    ],
                  ),
                  Image.asset('images/plane_with_trail.png', width: 50),
                  Column(
                    children: [
                      Text(
                        '${flightSchedule.arrAirportCode}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text('${flightSchedule.arrCity}'),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Perjalanan"),
                    Tab(text: "Fasilitas"),
                    Tab(text: "Harga"),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    TabPerjalanan(flightSchedule: flightSchedule),
                    TabFasilitas(flightSchedule: flightSchedule),
                    TabHarga(flightSchedule: flightSchedule),
                  ],
                ),
              ),
              // TicketDetailsBottomBar(sourcePage: sourcePage),
              // TODO: MASIH BUGGY, HARUS DIPERBAIKI
            ],
          ),
        ),
      );
    },
  );
}
