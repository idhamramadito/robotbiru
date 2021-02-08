import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details.dart';

class DetailPenerbangan extends StatefulWidget {
  @override
  _DetailPenerbanganState createState() => _DetailPenerbanganState();
}

class _DetailPenerbanganState extends State<DetailPenerbangan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Detail Penerbangan',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.0))),
            child: Row(
              children: [
                Text(
                  'Jakarta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_right_alt, size: 40),
                Text(
                  'Denpasar - Bali',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ticketDetails(context, 'Pemesanan');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15.0))),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CGK - DPS',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '20 Januari 2021 ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.circle, size: 5),
                          Text(
                            ' 1 Dewasa ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.circle, size: 5),
                          Text(
                            ' Ekonomi',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
