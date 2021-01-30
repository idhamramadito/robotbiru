import 'package:flutter/material.dart';

class ReceiptCard extends StatefulWidget {
  const ReceiptCard({
    Key key,
    this.cardName,
    @required this.dataList,
  }) : super(key: key);

  final String cardName;
  final List dataList;

  @override
  _ReceiptCardState createState() => _ReceiptCardState();
}

class _ReceiptCardState extends State<ReceiptCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Visibility(
            visible: (widget.cardName != null),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
              child: Text(
                widget.cardName ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          widget.dataList[index][0],
                          style: TextStyle(color: Colors.grey),
                        ),
                        new Text(widget.dataList[index][1]),
                      ]),
                );
              }),
        ],
      ),
    );
  }
}
