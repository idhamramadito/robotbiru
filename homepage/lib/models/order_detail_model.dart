class OrderDetailModel {
  String id;
  String name;
  String title;
  String countryCode;
  String phoneNumber;
  String email;

  var content;

  OrderDetailModel({
    String id,
    String name,
    String title,
    String countryCode,
    String phoneNumber,
    String email,
    var content,
  })  : this.id = id,
        this.name = name,
        this.title = title,
        this.countryCode = countryCode,
        this.phoneNumber = phoneNumber,
        this.email = email;
}
