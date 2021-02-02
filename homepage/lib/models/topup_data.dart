class TopUpData {
  String id;
  int targetNumber;
  String paymentMethod;
  double accountBalance;
  double chosenPrice;

  var content;

  TopUpData({
    String id,
    int targetNumber,
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
