import 'package:flutter/material.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, right: 15, left: 15),
      child: Card(
        elevation: 5,
        child: Container(
          width: 330,
          height: 80,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Image.asset(
                  "images/dompet.png",
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Saldo Anda",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Rp 12.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff008AD5)),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 50,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/topup');
                    },
                    color: Color(0xff008AD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Text(
                      "Isi Saldo",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
