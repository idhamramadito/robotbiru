class PassengersModel {
  String id;
  String name;
  String title;
  DateTime birthDate;

  var content;

  PassengersModel({
    String id,
    String name,
    String title,
    DateTime birthDate,
    var content,
  })  : this.id = id,
        this.name = name,
        this.title = title,
        this.birthDate = birthDate;
}
