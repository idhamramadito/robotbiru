import 'package:flutter/material.dart';
import 'package:homepage/models/schedule_model.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class TabHarga extends StatelessWidget {
  final ScheduleModel flightSchedule;
  const TabHarga({
    Key key,
    @required this.flightSchedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NameAndContent> _price = [
      NameAndContent(name: 'Dewasa (1x)', content: 'Rp 435.454'),
      NameAndContent(name: 'Cashback', content: 'Rp 2.500'),
    ];

    List<NameAndContent> _bonusList = [
      NameAndContent(name: 'Cashback', content: 'Rp 2.500'),
      NameAndContent(name: 'Anggota', content: 'Rp 3.500'),
      NameAndContent(name: 'Retail', content: 'Rp 6.000'),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
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
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_price[1].name}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_price[1].content}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            ReceiptCard(title: 'Bonus', dataList: _bonusList),
          ],
        ),
      ),
    );
  }
}
