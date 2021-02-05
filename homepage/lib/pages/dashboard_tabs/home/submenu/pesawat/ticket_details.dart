import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details_tabs/tab_fasilitas.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details_tabs/tab_harga.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details_tabs/tab_perjalanan.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';

Future ticketDetails(BuildContext context, String sourcePage) {
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
                    Tab(text: "Perjalanan"),
                    Tab(text: "Fasilitas"),
                    Tab(text: "Harga"),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    TabPerjalanan(),
                    TabFasilitas(),
                    TabHarga(),
                  ],
                ),
              ),
              Visibility(
                visible: sourcePage == 'Jadwal Pesawat',
                child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black.withOpacity(0.1))
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp 307.000',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "per orang",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: BigButton(
                          title: 'Pesan Tiket',
                          onPressed: () {
                            Navigator.of(context).pushNamed('/pemesanan');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
