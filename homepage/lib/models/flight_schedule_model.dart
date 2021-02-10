class FlightScheduleModel {
  String iconAirline;
  String id;
  String airlineName;
  String depTime;
  String depAirportCode;
  String depAirport;
  String depCity;
  String flightTime;
  String flightType;
  String arrTime;
  String arrAirportCode;
  String arrAirport;
  String arrCity;
  int chairLeft;
  String chairClass;
  double ticketPrice;
  double cashback;
  double anggota;
  double retail;

  // data transit
  bool isTransit;

  FlightScheduleModel({
    String iconAirline,
    String id,
    String airlineName,
    String depTime,
    String depAirportCode,
    String depAirport,
    String depCity,
    String flightTime,
    String flightType,
    String arrTime,
    String arrAirport,
    String arrAirportCode,
    String arrCity,
    int chairLeft,
    String chairClass,
    double ticketPrice,
    double cashback,
    double anggota,
    double retail,
    bool isTransit,
  })  : this.iconAirline = iconAirline,
        this.id = id,
        this.airlineName = airlineName,
        this.depTime = depTime,
        this.depAirportCode = depAirportCode,
        this.depAirport = depAirport,
        this.depCity = depCity,
        this.flightTime = flightTime,
        this.flightType = flightType,
        this.arrTime = arrTime,
        this.arrAirportCode = arrAirportCode,
        this.arrAirport = arrAirport,
        this.arrCity = arrCity,
        this.chairLeft = chairLeft,
        this.chairClass = chairClass,
        this.ticketPrice = ticketPrice,
        this.cashback = cashback,
        this.anggota = anggota,
        this.retail = retail,
        this.isTransit = isTransit;
}
