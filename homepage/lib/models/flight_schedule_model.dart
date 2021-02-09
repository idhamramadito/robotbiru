import 'package:flutter/material.dart';

class FlightScheduleModel {
  String id;
  Icon iconAirline;
  String airlineName;
  String depTime;
  String depAirport;
  String flightTime;
  String flightType;
  String arrTime;
  String arrAirport;
  int chairLeft;
  double ticketPrice;
  double cashback;
  double anggota;
  double retail;

  FlightScheduleModel({
    String id,
    Icon iconAirline,
    String airlineName,
    String depTime,
    String depAirport,
    String flightTime,
    String flightType,
    String arrTime,
    String arrAirport,
    int chairLeft,
    double ticketPrice,
    double cashback,
    double anggota,
    double retail,
  })  : this.id = id,
        this.iconAirline = iconAirline,
        this.airlineName = airlineName,
        this.depTime = depTime,
        this.depAirport = depAirport,
        this.flightTime = flightTime,
        this.flightType = flightType,
        this.arrTime = arrTime,
        this.arrAirport = arrAirport,
        this.chairLeft = chairLeft,
        this.ticketPrice = ticketPrice,
        this.cashback = cashback,
        this.anggota = anggota,
        this.retail = retail;
}
