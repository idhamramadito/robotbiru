import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNoHandphone extends StatefulWidget {
  const FormNoHandphone({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  _FormNoHandphoneState createState() => _FormNoHandphoneState();
}

class _FormNoHandphoneState extends State<FormNoHandphone> {
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Masukkan Nomor HP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _textController,
                    onChanged: widget.onChanged,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, size: 30),
                        onPressed: () => _textController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Nomor Handphone",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.perm_contact_cal),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
