import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';

class ReceiptCard extends StatefulWidget {
  const ReceiptCard({
    Key key,
    this.title,
    @required this.dataList,
  }) : super(key: key);

  final String title;
  final List<NameAndContent> dataList;

  @override
  _ReceiptCardState createState() => _ReceiptCardState();
}

class _ReceiptCardState extends State<ReceiptCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.dataList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Text(
                        widget.dataList[index].name ?? 'NULL',
                        style: TextStyle(color: Colors.grey),
                      ),
                      new Text(widget.dataList[index].content ?? 'NULL'),
                    ]),
              );
            }),
      ],
    );
  }
}
