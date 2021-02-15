class NameAndContent {
  String id;
  String name;
  String logo;
  var content;
  NameAndContent({
    String id,
    String name,
    String logo,
    var content,
  })  : this.id = id,
        this.name = name,
        this.logo = logo,
        this.content = content;
}
