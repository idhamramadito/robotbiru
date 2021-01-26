import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 150),
      child: Card(
        elevation: 5,
        child: Container(
          width: 330,
          child: ListTile(
            leading: Image.asset("images/dompet.png", width: 40),
            title: Text(
              "Saldo Anda",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Rp 12.000",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff008AD5),
              ),
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  primary: Colors.blue[600],
                  onPrimary: Colors.white),
              onPressed: () {
                Navigator.of(context).pushNamed('/topup');
              },
              child: Text(
                "Isi Saldo",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
