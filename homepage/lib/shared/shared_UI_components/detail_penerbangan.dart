import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:intl/intl.dart';

class DetailPenerbangan extends StatefulWidget {
  final TransportationModel previousData;

  DetailPenerbangan({
    Key key,
    this.onTap,
    this.previousData,
  }) : super(key: key);
  final Function onTap;
  @override
  _PenerbanganDetailState createState() => _PenerbanganDetailState();
}

class _PenerbanganDetailState extends State<DetailPenerbangan> {
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
                  widget.previousData.origin,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.arrow_right_alt, size: 40),
                Text(
                  widget.previousData.destination,
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
              widget.onTap();
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
                      Text(
                        '${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateDepart)}${(widget.previousData.isTwoWayTrip) ? ' - ${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateReturn)}' : ''} ${String.fromCharCode(0x2022)} ${widget.previousData.cabinClass} ${String.fromCharCode(0x2022)} ${(widget.previousData.passengers[0][1] > 0) ? '${widget.previousData.passengers[0][1]} ${widget.previousData.passengers[0][0]}' : ''}${(widget.previousData.passengers[1][1] > 0) ? ', ${widget.previousData.passengers[1][1]} ${widget.previousData.passengers[1][0]}' : ''}${(widget.previousData.passengers[2][1] > 0) ? ', ${widget.previousData.passengers[2][1]} ${widget.previousData.passengers[2][0]}' : ''}',
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
