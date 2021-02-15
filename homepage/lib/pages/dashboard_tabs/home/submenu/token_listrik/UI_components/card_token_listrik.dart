import 'package:flutter/material.dart';

class CardTokenListrik extends StatefulWidget {
  const CardTokenListrik({
    Key key,
    @required this.idNumber,
  }) : super(key: key);

  final String idNumber;

  @override
  _CardTokenListrikState createState() => _CardTokenListrikState();
}

class _CardTokenListrikState extends State<CardTokenListrik> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(16.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Pelanggan",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text(
                    "Martin Keren",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  '${widget.idNumber}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tarif/Daya",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text(
                    "R2/3500VA",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
