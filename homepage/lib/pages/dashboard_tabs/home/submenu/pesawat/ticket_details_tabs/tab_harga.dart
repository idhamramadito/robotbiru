import 'package:flutter/material.dart';

class TabHarga extends StatelessWidget {
  const TabHarga({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonus',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cashback',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                Text(
                  'Rp 2.500',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Anggota',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                Text(
                  'Rp 3.500',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Retail',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                Text(
                  'Rp 6.000',
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
