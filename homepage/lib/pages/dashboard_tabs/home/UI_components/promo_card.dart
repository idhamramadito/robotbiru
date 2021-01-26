import 'package:flutter/material.dart';

class PromoCard1 extends StatelessWidget {
  const PromoCard1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "BotRide",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Jaga Selalu Diri Anda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("Let's check tips for you"),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset("images/promo3.png"),
          ),
        ],
      ),
    );
  }
}

class PromoCard2 extends StatelessWidget {
  const PromoCard2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "BotFood",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Jaga Selalu Diri Anda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("Let's check tips for you"),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset("images/promo1.png"),
          ),
        ],
      ),
    );
  }
}