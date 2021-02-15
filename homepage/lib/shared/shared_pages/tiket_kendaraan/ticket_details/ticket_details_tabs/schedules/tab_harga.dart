import 'package:flutter/material.dart';
import 'package:homepage/models/schedule_model.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class TabHarga extends StatelessWidget {
  final ScheduleModel flightSchedule;
  final TransportationModel prevData;
  const TabHarga({
    Key key,
    @required this.flightSchedule,
    @required this.prevData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _ticketPrice = 435454;
    List<NameAndContent> _costs = [
      for (var element in prevData.passengersAmount)
        if (element.content > 0)
          NameAndContent(
              name: '${element.name} (${element.content}x)',
              content: 'Rp ${_ticketPrice * element.content}')
    ];

    NameAndContent _total =
        NameAndContent(name: 'Total Pembayaran', content: 'Rp 435.454');

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
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: _costs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_costs[index].name}',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '${_costs[index].content}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            Divider(),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_total.content}',
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
