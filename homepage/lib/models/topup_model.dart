import 'package:homepage/models/topup_package_model.dart';

class TopUpModel {
  String id;
  String transactionType;
  String currency;
  String targetNumber;
  String paymentMethod;
  double accountBalance;
  TopUpPackageModel chosenPackage;
  String invoiceRoute;
  var content;

  TopUpModel({
    String id,
    String transactionType,
    String currency,
    String targetNumber,
    String paymentMethod,
    double accountBalance,
    TopUpPackageModel chosenPackage,
    String invoiceRoute,
    var content,
  })  : this.id = id,
        this.transactionType = transactionType,
        this.currency = currency,
        this.targetNumber = targetNumber,
        this.paymentMethod = paymentMethod,
        this.accountBalance = accountBalance,
        this.invoiceRoute = invoiceRoute,
        this.chosenPackage = chosenPackage;
}
