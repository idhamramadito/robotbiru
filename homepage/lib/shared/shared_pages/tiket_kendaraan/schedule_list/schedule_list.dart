import 'package:flutter/material.dart';
import 'package:homepage/models/flight_schedule_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/filter_list.dart';
import 'package:homepage/shared/shared_UI_components/schedule_card.dart';
import 'package:homepage/shared/shared_UI_components/date_picker.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:intl/intl.dart';

class ScheduleList extends StatefulWidget {
  final TransportationModel previousData;

  ScheduleList({
    this.previousData,
    Key key,
  }) : super(key: key);

  @override
  _ListJadwalKendaraanState createState() => _ListJadwalKendaraanState();
}

class _ListJadwalKendaraanState extends State<ScheduleList> {
  List _filterButton = ["Langsung", "Gratis Bagasi", "Makanan Gratis"];
  List _sementara;
  List<FlightScheduleModel> _jadwalPenerbangan = [
    FlightScheduleModel(
      iconAirline: "images/japan-airlines.png",
      id: "",
      airlineName: "Jakarta Airlines",
      depTime: "05.00",
      depAirportCode: "CGK",
      depAirport: 'Soekarno Hatta',
      depCity: 'Jakarta',
      flightTime: "10J",
      flightType: "Langsung",
      arrTime: "15.00",
      arrAirportCode: "DPS",
      arrAirport: 'Ngurah Rai',
      arrCity: 'Denpasar - Bali',
      chairLeft: 2,
      ticketPrice: 315000,
      cashback: 2500,
      anggota: 2500,
      retail: 2500,
    ),
    FlightScheduleModel(
      iconAirline: "images/japan-airlines.png",
      id: "",
      airlineName: "Papua Airlines",
      depTime: "05.00",
      depAirportCode: "BIK",
      depAirport: 'Frans Kaisepo',
      depCity: 'Biak',
      flightTime: "10J",
      flightType: "Transit",
      arrTime: "15.00",
      arrAirportCode: "CGK",
      arrAirport: 'Soekarno Hatta',
      arrCity: 'Jakarta',
      chairLeft: 2,
      ticketPrice: 315000,
      cashback: 2500,
      anggota: 2500,
      retail: 2500,
    ),
  ];

  List<FlightScheduleModel> _jadwalKereta = [
    FlightScheduleModel(
      iconAirline: "images/logo_kereta.png",
      id: "",
      airlineName: "Argo Parahyangan 7001A",
      depTime: "05.00",
      depAirportCode: "BDG",
      depAirport: 'Stasiun Bandung',
      depCity: 'Bandung',
      flightTime: "4J 50m",
      flightType: "Langsung",
      arrTime: "09.50",
      arrAirportCode: "BKS",
      arrAirport: 'Stasiun Bekasi',
      arrCity: 'Bekasi',
      chairLeft: 2,
      ticketPrice: 305200,
      cashback: 2500,
      anggota: 3500,
      retail: 6000,
      chairClass: "Economy (Subclass C)",
    ),
    FlightScheduleModel(
      iconAirline: "images/logo_kereta.png",
      id: "",
      airlineName: "Serayu 434",
      depTime: "05.00",
      depAirportCode: "BDG",
      depAirport: 'Stasiun Bandung',
      depCity: 'Bandung',
      flightTime: "4J 50m",
      flightType: "Langsung",
      arrTime: "09.50",
      arrAirportCode: "BKS",
      arrAirport: 'Stasiun Bekasi',
      arrCity: 'Bekasi',
      chairLeft: 2,
      ticketPrice: 305200,
      cashback: 2500,
      anggota: 3500,
      retail: 6000,
      chairClass: "Economy (Subclass C)",
    ),
  ];

  @override
  void initState() {
    widget.previousData.chosenDepartSchedule = null;
    widget.previousData.chosenReturnSchedule = null;

    switch (widget.previousData.transportationType) {
      case 'Pesawat':
        _sementara = List.from(_jadwalPenerbangan);
        break;
      case 'Kereta':
        _sementara = List.from(_jadwalKereta);
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.previousData.origin} > ${widget.previousData.destination}",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              '${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateDepart)}${(widget.previousData.isTwoWayTrip) ? ' - ${DateFormat("d MMM yy", "id_ID").format(widget.previousData.dateReturn)}' : ''} ${String.fromCharCode(0x2022)} ${widget.previousData.cabinClass} ${String.fromCharCode(0x2022)} ${widget.previousData.passengersAmount.map((element) => (element.content > 0) ? '${element.content} ${element.name}' : '').toString()}',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (widget.previousData.isTwoWayTrip == true &&
              widget.previousData.chosenDepartSchedule != null)
            Container(
              color: Colors.blue[50],
              child: ListTile(
                leading: Image.asset(
                    '${widget.previousData.chosenDepartSchedule.iconAirline}'),
                title: Text(
                  '${widget.previousData.chosenDepartSchedule.airlineName}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      '${widget.previousData.chosenDepartSchedule.ticketPrice}',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('/Orang'),
                  ],
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      side: BorderSide(color: Colors.blue),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  child: Text('Ubah'),
                  onPressed: () {
                    setState(() {
                      widget.previousData.chosenDepartSchedule = null;
                    });
                  },
                ),
              ),
            ),
          if (widget.previousData.transportationType.contains('Pesawat'))
            Center(
              child: Container(
                width: 392,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey[300])),
                          child: new Text(
                            '${_filterButton[0]}',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.grey[300])),
                          child: new Text(
                            '${_filterButton[1]}',
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.grey[300])),
                        child: new Text(
                          '${_filterButton[2]}',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _sementara.length,
              itemBuilder: (context, index) {
                return ScheduleCard(
                  flightSchedule: _sementara[index],
                  previousData: widget.previousData,
                  onTap: (widget.previousData.isTwoWayTrip == false)
                      ? () {
                          setState(() {
                            widget.previousData.chosenDepartSchedule =
                                _sementara[index] ??
                                    widget.previousData.chosenDepartSchedule;
                          });
                          Navigator.of(context).pushNamed(
                            '/pemesanan',
                            arguments: widget.previousData,
                          );
                        }
                      : (widget.previousData.chosenDepartSchedule == null)
                          ? () {
                              setState(() {
                                widget.previousData.chosenDepartSchedule =
                                    _sementara[index] ??
                                        widget
                                            .previousData.chosenDepartSchedule;
                              });
                            }
                          // TODO: ganti list flightSchedule dari yg pergi ke yg pulang
                          : () {
                              setState(() {
                                widget.previousData.chosenReturnSchedule =
                                    _sementara[index] ??
                                        widget
                                            .previousData.chosenReturnSchedule;
                              });
                              Navigator.of(context).pushNamed(
                                '/pemesanan',
                                arguments: widget.previousData,
                              );
                            },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            heroTag: 'filterButton',
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0),
              ),
            ),
            icon: Icon(
              Icons.filter_list,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Filter',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {
              filterList(context);
            },
          ),
          FloatingActionButton.extended(
            heroTag: 'dateButton',
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            icon: Icon(
              Icons.calendar_today,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Tanggal',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: (widget.previousData.isTwoWayTrip)
                ? () async {
                    var result = await dateRangePicker(context);
                    if (result != null) {
                      setState(() {
                        widget.previousData.dateDepart =
                            result[0] ?? widget.previousData.dateDepart;
                        widget.previousData.dateReturn =
                            result[1] ?? widget.previousData.dateReturn;
                      });
                    }
                  }
                : () async {
                    var result = await datePicker(context);
                    setState(() {
                      widget.previousData.dateDepart =
                          result ?? widget.previousData.dateDepart;
                    });
                  },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
