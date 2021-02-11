import 'package:flutter/material.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class PemesananBottomBar extends StatefulWidget {
  final TransportationModel prevData;

  const PemesananBottomBar({
    Key key,
    this.prevData,
  }) : super(key: key);

  @override
  _PemesananBottomBarState createState() => _PemesananBottomBarState();
}

class _PemesananBottomBarState extends State<PemesananBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/harga_detail');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Rp 307.000',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                )
              ],
            ),
          ),
          BigButton(
            title: 'Lanjut Pembayaran',
            onPressed: ([
              widget.prevData.orderDetails.name,
              for (var element in widget.prevData.passengersDetails)
                element.name
            ].contains(null))
                ? null
                : () {
                    Navigator.of(context)
                        .pushNamed('/pembayaran', arguments: widget.prevData);
                  },
          ),
        ],
      ),
    );
  }
}
