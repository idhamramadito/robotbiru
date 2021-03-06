import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  _RememberMeCheckBoxState createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: rememberMe,
      onChanged: (newVal) {
        rememberMe = newVal;
        widget.onChanged();
      },
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        "Simpan Nomor",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
    );
  }
}
