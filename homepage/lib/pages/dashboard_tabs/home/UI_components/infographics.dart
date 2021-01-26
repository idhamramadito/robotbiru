import 'package:flutter/material.dart';

class Infographics extends StatelessWidget {
  const Infographics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
