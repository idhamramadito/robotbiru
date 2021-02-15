import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currency = 'Rp';
    double accountBalance = 12000;

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: ListTile(
        dense: true,
        leading: Image.asset("images/dompet.png", width: 40),
        title: Text(
          "Saldo Anda",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$currency $accountBalance',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              primary: Theme.of(context).primaryColor,
              onPrimary: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/topup');
          },
          child: Text(
            "Isi Saldo",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
