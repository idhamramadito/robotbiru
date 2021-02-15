class TopUpModel {
  String id;
  String targetNumber;
  String paymentMethod;
  double accountBalance;
  double chosenPrice;

  var content;

  TopUpModel({
    String id,
    String targetNumber,
    String paymentMethod,
    double accountBalance,
    double chosenPrice,
    var content,
  })  : this.id = id,
        this.targetNumber = targetNumber,
        this.paymentMethod = paymentMethod,
        this.accountBalance = accountBalance,
        this.chosenPrice = chosenPrice;
}
