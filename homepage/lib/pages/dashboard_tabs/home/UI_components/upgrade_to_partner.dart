import 'package:flutter/material.dart';

class UpgradeToPartner extends StatelessWidget {
  const UpgradeToPartner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 180),
      child: Card(
        elevation: 5,
        child: Container(
          width: 330,
          height: 80,
          color: Color(0xff008AD5),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      "Upgrade Menjadi",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Mitra Robot Biru Yuk",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 50,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Text(
                      "Retail",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff008AD5),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 50,
                  height: 50,
                  child: FlatButton(
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      child: Container(
                          width: 55,
                          height: 50,
                          child: Wrap(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Komunitas/Koperasi",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff008AD5),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
