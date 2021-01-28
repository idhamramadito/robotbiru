import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    Key key,
  }) : super(key: key);

  @override
  _RememberMeCheckBoxState createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 25, 0),
      child: Row(
        children: [
          Checkbox(
            value: rememberMe,
            onChanged: _onRememberMeChanged,
          ),
          Text("Simpan Nomor",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
