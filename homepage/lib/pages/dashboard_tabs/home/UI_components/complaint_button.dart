import 'package:flutter/material.dart';

class ComplaintButton extends StatelessWidget {
  const ComplaintButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
          onPressed: () {},
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey)),
          child: Text(
            "Punya Keluhan ? Silahkan Lapor Disini",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
