    import 'package:flutter/material.dart';

class NominalPulsa extends StatefulWidget {
  @override
  _NominalPulsaState createState() => _NominalPulsaState();
}

class _NominalPulsaState extends State<NominalPulsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          'Nominal Pulsa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
       ),
      body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
            onPressed: () {},
            color: Color(0xffDDDDDD),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "20.000",
                    style: TextStyle(fontSize: 15, color: Color(0xff818181)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
            ),
      ),
    )
    );
  }
}