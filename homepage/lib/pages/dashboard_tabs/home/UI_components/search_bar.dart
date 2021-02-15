import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
            onPressed: () {
              // TODO: untuk sementara diarahkan ke detail transaksi topup
              Navigator.of(context).pushNamed('/invoice_topup');
            },
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
                    style: TextStyle(fontSize: 15, color: Color(0xff818181)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
