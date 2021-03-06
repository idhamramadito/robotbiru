import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:intl/intl.dart';

class DetailPenerbangan extends StatefulWidget {
  final TransportationModel previousData;

  DetailPenerbangan({
    Key key,
    @required this.onTap,
    @required this.previousData,
  }) : super(key: key);
  final Function onTap;
  @override
  _PenerbanganDetailState createState() => _PenerbanganDetailState();
}

class _PenerbanganDetailState extends State<DetailPenerbangan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Detail Perjalanan',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.previousData.origin,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      (widget.previousData.isTwoWayTrip)
                          ? Icons.sync_alt
                          : Icons.arrow_right_alt,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        widget.previousData.destination,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.black),
                ListTile(
                  onTap: () => widget.onTap(0),
                  dense: true,
                  title: Text(
                    '${widget.previousData.chosenDepartSchedule.depCode} - ${widget.previousData.chosenDepartSchedule.arrCode}',
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    '${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateDepart)} ${String.fromCharCode(0x2022)} ${widget.previousData.cabinClass} ${String.fromCharCode(0x2022)} ${widget.previousData.passengersAmount.map((element) => (element.content > 0) ? '${element.content} ${element.name}' : '').toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down, size: 30),
                ),
                if (widget.previousData.isTwoWayTrip)
                  Divider(color: Colors.black),
                if (widget.previousData.isTwoWayTrip)
                  ListTile(
                    onTap: () => widget.onTap(1),
                    dense: true,
                    title: Text(
                      '${widget.previousData.chosenReturnSchedule.depCode} - ${widget.previousData.chosenReturnSchedule.arrCode}',
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      '${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateReturn)} ${String.fromCharCode(0x2022)} ${widget.previousData.cabinClass} ${String.fromCharCode(0x2022)} ${widget.previousData.passengersAmount.map((element) => (element.content > 0) ? '${element.content} ${element.name}' : '').toString()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down, size: 30),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
