import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details_tabs/tab_detailed.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details/ticket_details_tabs/tab_price.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

class TicketDetailsPage extends StatefulWidget {
  @override
  _TicketDetailsPageState createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER ID : 348348348'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SlideUpMarker(),
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
                        'CGK',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Jakarta"),
                    ],
                  ),
                  Image.asset('images/plane_with_trail.png', width: 50),
                  Column(
                    children: [
                      Text(
                        'DPS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text("Denpasar"),
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
                    Tab(text: "Detail"),
                    Tab(text: "Harga"),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    TabDetailed(),
                    TabPrice(),
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