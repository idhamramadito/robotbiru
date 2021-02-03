import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class TabHarga extends StatelessWidget {
  const TabHarga({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _bonusList = [
      ['Cashback', 'Rp 2.500'],
      ['Anggota', 'Rp 3.500'],
      ['Retail', 'Rp 6.000'],
    ];

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dewasa (1x)',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  'Rp 435.454',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 15),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp 435.454',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 15),
          ReceiptCard(title: 'Bonus', dataList: _bonusList),
        ],
      ),
    );
  }
}
