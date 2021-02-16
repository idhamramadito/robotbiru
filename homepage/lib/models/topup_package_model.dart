class TopUpPackageModel {
  String id;
  String name;
  String logoPath;
  double price;
  TopUpPackageModel({
    String id,
    String name,
    String logoPath,
    double price,
  })  : this.id = id,
        this.name = name,
        this.logoPath = logoPath,
        this.price = price;
}
