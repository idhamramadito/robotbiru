import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/order_detail_model.dart';
import 'package:homepage/models/flight_schedule_model.dart';

class TransportationModel {
  // diisi di halaman basic_info
  String id;
  String transportationType;
  bool isTwoWayTrip;
  String origin;
  String destination;
  DateTime dateDepart;
  DateTime dateReturn;
  List<NameAndContent> passengersAmount;
  String cabinClass;
  String airline;

  // diisi di halaman jadwal kendaraan
  FlightScheduleModel chosenDepartSchedule;
  FlightScheduleModel chosenReturnSchedule;

  // diisi di halaman pemesanan
  OrderDetailModel orderDetails;
  List passengersDetails;
  bool sameAsBuyer;
  bool fullProtection;
  bool luggageInsurance;
  List luggageSize;

  // diisi di halaman pembayaran
  List paymentMethod;

  TransportationModel({
    String id,
    String transportationType,
    bool isTwoWayTrip,
    String origin,
    String destination,
    DateTime dateDepart,
    DateTime dateReturn,
    List<NameAndContent> passengersAmount,
    String cabinClass,
    String airline,
    FlightScheduleModel chosenDepartSchedule,
    FlightScheduleModel chosenReturnSchedule,
    OrderDetailModel orderDetails,
    List passengersDetails,
    bool sameAsBuyer,
    bool fullProtection,
    bool luggageInsurance,
    List luggageSize,
    List paymentMethod,
  })  : this.id = id,
        this.transportationType = transportationType,
        this.isTwoWayTrip = isTwoWayTrip,
        this.origin = origin,
        this.destination = destination,
        this.dateDepart = dateDepart,
        this.dateReturn = dateReturn,
        this.passengersAmount = passengersAmount,
        this.cabinClass = cabinClass,
        this.airline = airline,
        this.chosenDepartSchedule = chosenDepartSchedule,
        this.chosenReturnSchedule = chosenReturnSchedule,
        this.orderDetails = orderDetails,
        this.passengersDetails = passengersDetails,
        this.sameAsBuyer = sameAsBuyer,
        this.fullProtection = fullProtection,
        this.luggageInsurance = luggageInsurance,
        this.luggageSize = luggageSize,
        this.paymentMethod = paymentMethod;
}
