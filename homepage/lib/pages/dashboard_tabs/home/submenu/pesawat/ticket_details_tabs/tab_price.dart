import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class TabPrice extends StatelessWidget {
  const TabPrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NameAndContent> _price = [
      NameAndContent(name: 'Dewasa (1x)', content: 'Rp 435.454'),
      NameAndContent(name: 'Biaya Jasa', content: 'Rp 5.865'),
      NameAndContent(name: 'Total Pembayaran', content: 'Rp 565.454'),
      NameAndContent(name: 'Tarif'),
      NameAndContent(name: 'Biaya Lainnya'),
    ];

    List<NameAndContent> _bonusList = [
      NameAndContent(name: 'Cashback', content: 'Rp 2.500'),
      NameAndContent(name: 'Anggota', content: 'Rp 3.500'),
      NameAndContent(name: 'Retail', content: 'Rp 6.000'),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Jakarta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        size: 30,
                      ),
                      Text(
                        'Denpasar - Bali',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${_price[3].name}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_price[0].name}',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '${_price[0].content}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${_price[4].name}',
                      style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_price[1].name}',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '${_price[1].content}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_price[2].name}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_price[2].content}',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            ReceiptCard(title: 'Bonus', dataList: _bonusList),
          ],
        ),
      ),
    );
  }
}
