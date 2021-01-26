import 'package:flutter/material.dart';

class UpgradeToPartner extends StatelessWidget {
  const UpgradeToPartner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xff008AD5),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Upgrade Menjadi \nMitra Robot Biru",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                "Retail",
                style: TextStyle(
                    color: Color(0xff008AD5), fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                "Koperasi/ \nKomunitas",
                style: TextStyle(
                    color: Color(0xff008AD5), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
