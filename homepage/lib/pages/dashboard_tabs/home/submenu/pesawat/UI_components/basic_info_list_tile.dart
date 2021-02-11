import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicInfoListTile extends StatefulWidget {
  const BasicInfoListTile({
    Key key,
    @required this.data,
    @required this.name,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final data;
  final String name;
  final IconData icon;
  final Function onPressed;

  @override
  _BasicInfoListTileState createState() => _BasicInfoListTileState();
}

class _BasicInfoListTileState extends State<BasicInfoListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: UniqueKey(),
      dense: true,
      onTap: widget.onPressed,
      leading: Icon(
        widget.icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        '${widget.name ?? 'Kosong'}',
        style: TextStyle(color: Colors.grey),
      ),
      subtitle: Text(
        (widget.data == null)
            ? 'Belum Dipilih'
            : (widget.name == 'Jumlah Penumpang')
                ? widget.data
                    .map((element) => (element.content > 0)
                        ? '${element.content} ${element.name}'
                        : '')
                    .toString()
                : (widget.name == 'Tanggal Pergi' ||
                        widget.name == 'Tanggal Pulang')
                    ? DateFormat("EEEE, d MMMM yyyy", "id_ID")
                        .format(widget.data)
                    : '${widget.data}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: (widget.data == null) ? Colors.grey[300] : Colors.black,
        ),
      ),
    );
  }
}
