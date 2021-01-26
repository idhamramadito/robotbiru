import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
            onPressed: () {},
            color: Color(0xffFAFAFA),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    "images/search.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Mau Cari Apa?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff818181),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
