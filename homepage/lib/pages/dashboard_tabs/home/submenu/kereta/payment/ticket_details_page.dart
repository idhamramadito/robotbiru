import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details_tabs/payment/detail_harga.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details_tabs/payment/detail_pergi.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details_tabs/payment/detail_pulang.dart';

class TicketDetailsPage extends StatefulWidget {
  final TransportationModel prevData;

  const TicketDetailsPage({
    Key key,
    this.prevData,
  }) : super(key: key);

  @override
  _TicketDetailsPageState createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER ID : ${widget.prevData.id}'),
      ),
      body: DefaultTabController(
        length: (widget.prevData.isTwoWayTrip == false) ? 2 : 3,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail Penerbangan',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '${widget.prevData.chosenDepartSchedule.depAirportCode}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text('${widget.prevData.chosenDepartSchedule.depCity}'),
                    ],
                  ),
                  Image.asset('images/plane_with_trail.png', width: 50),
                  Column(
                    children: [
                      Text(
                        '${widget.prevData.chosenDepartSchedule.arrAirportCode}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text('${widget.prevData.chosenDepartSchedule.arrCity}'),
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
                    Tab(text: "Pergi"),
                    if (widget.prevData.isTwoWayTrip) Tab(text: "Pulang"),
                    Tab(text: "Harga"),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    PergiTab(prevData: widget.prevData),
                    if (widget.prevData.isTwoWayTrip)
                      PulangTab(prevData: widget.prevData),
                    HargaTab(prevData: widget.prevData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
