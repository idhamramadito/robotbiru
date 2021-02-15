import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/transportation_model.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';

class HargaTab extends StatelessWidget {
  final TransportationModel prevData;
  const HargaTab({
    Key key,
    this.prevData,
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

    List<NameAndContent> _otherCosts = [
      NameAndContent(name: 'Biaya Jasa', content: 'Rp 5.865'),
    ];

    NameAndContent _total =
        NameAndContent(name: 'Total Pembayaran', content: 'Rp 565.454');

    List<NameAndContent> _bonusList = [
      NameAndContent(name: 'Cashback', content: 'Rp 2.500'),
      NameAndContent(name: 'Anggota', content: 'Rp 3.500'),
      NameAndContent(name: 'Retail', content: 'Rp 6.000'),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
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
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tarif',
                    style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                  ),
                ),
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
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Biaya Lainnya',
                    style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                  ),
                ),
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
                            '${_otherCosts[index].name}',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            '${_otherCosts[index].content}',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    );
                  },
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
                  '${_total.name}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_total.content}',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
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
