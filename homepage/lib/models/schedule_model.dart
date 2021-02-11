class ScheduleModel {
  String icon;
  String id;
  String transName;
  String depTime;
  String depCode; //kode bandara atau station
  String depFullName; //nama bandara atau station
  String depCity; //kota
  String tripTime;
  String tripType;
  String arrTime;
  String arrCode;
  String arrFullName;
  String arrCity;
  int chairLeft;
  String chairClass;
  double ticketPrice;
  double cashback;
  double anggota;
  double retail;

  ScheduleModel({
    String icon,
    String id,
    String transName,
    String depTime,
    String depCode,
    String depFullName,
    String depCity,
    String tripTime,
    String tripType,
    String arrTime,
    String arrFullName,
    String arrCode,
    String arrCity,
    int chairLeft,
    String chairClass,
    double ticketPrice,
    double cashback,
    double anggota,
    double retail,
  })  : this.icon = icon,
        this.id = id,
        this.transName = transName,
        this.depTime = depTime,
        this.depCode = depCode,
        this.depFullName = depFullName,
        this.depCity = depCity,
        this.tripTime = tripTime,
        this.tripType = tripType,
        this.arrTime = arrTime,
        this.arrCode = arrCode,
        this.arrFullName = arrFullName,
        this.arrCity = arrCity,
        this.chairLeft = chairLeft,
        this.chairClass = chairClass,
        this.ticketPrice = ticketPrice,
        this.cashback = cashback,
        this.anggota = anggota,
        this.retail = retail;
}
