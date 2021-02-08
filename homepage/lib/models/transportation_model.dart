class TransportationModel {
  String id;
  String transportationType;
  bool isTwoWayTrip;
  String origin;
  String destination;
  DateTime dateDepart;
  DateTime dateReturn;
  List passengers;
  String cabinClass;
  String airline;

  TransportationModel({
    String id,
    String transportationType,
    bool isTwoWayTrip,
    String origin,
    String destination,
    DateTime dateDepart,
    DateTime dateReturn,
    List passengers,
    String cabinClass,
    String airline,
  })  : this.id = id,
        this.transportationType = transportationType,
        this.isTwoWayTrip = isTwoWayTrip,
        this.origin = origin,
        this.destination = destination,
        this.dateDepart = dateDepart,
        this.dateReturn = dateReturn,
        this.passengers = passengers,
        this.cabinClass = cabinClass,
        this.airline = airline;
}
