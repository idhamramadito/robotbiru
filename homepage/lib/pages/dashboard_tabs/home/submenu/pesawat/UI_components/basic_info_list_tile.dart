import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicInfoListTile extends StatefulWidget {
  const BasicInfoListTile({
    Key key,
    @required this.data,
    @required this.name,
    @required this.icon,
    @required this.onPressed,
    this.switchValue,
    this.onSwitched,
  }) : super(key: key);

  final data;
  final String name;
  final IconData icon;
  final Function onPressed;
  final bool switchValue;
  final Function onSwitched;

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
                ? '${widget.data[0][1]} ${widget.data[0][0]}, ${widget.data[1][1]} ${widget.data[1][0]}, ${widget.data[2][1]} ${widget.data[2][0]}'
                : (widget.name == 'Tanggal Pergi' ||
                        widget.name == 'Tanggal Pulang')
                    ? DateFormat('EEEE, MMMM d yyyy').format(widget.data)
                    : '${widget.data}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: (widget.data == null) ? Colors.grey[300] : Colors.black,
        ),
      ),
      trailing: Visibility(
        visible: widget.switchValue != null,
        child: Switch(
          value: widget.switchValue,
          onChanged: (val) {
            widget.onSwitched(val);
          },
        ),
      ),
    );
  }
}
