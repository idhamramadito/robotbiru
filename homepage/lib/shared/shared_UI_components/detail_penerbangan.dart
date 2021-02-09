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
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15.0))),
            child: ListTile(
              onTap: widget.onTap,
              dense: true,
              title: Text(
                '${widget.previousData.chosenDepartSchedule.depAirportCode} - ${widget.previousData.chosenDepartSchedule.arrAirportCode}', // TODO: harus diganti dengan kode bandara
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                '${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateDepart)}${(widget.previousData.isTwoWayTrip) ? ' - ${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateReturn)}' : ''} ${String.fromCharCode(0x2022)} ${widget.previousData.cabinClass} ${String.fromCharCode(0x2022)} ${(widget.previousData.passengersAmount[0][1] > 0) ? '${widget.previousData.passengersAmount[0][1]} ${widget.previousData.passengersAmount[0][0]}' : ''}${(widget.previousData.passengersAmount[1][1] > 0) ? ', ${widget.previousData.passengersAmount[1][1]} ${widget.previousData.passengersAmount[1][0]}' : ''}${(widget.previousData.passengersAmount[2][1] > 0) ? ', ${widget.previousData.passengersAmount[2][1]} ${widget.previousData.passengersAmount[2][0]}' : ''}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.keyboard_arrow_down, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
