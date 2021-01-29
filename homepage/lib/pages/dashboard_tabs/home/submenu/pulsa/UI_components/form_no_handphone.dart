import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNoHandphone extends StatefulWidget {
  const FormNoHandphone({
    Key key,
    @required this.onChanged,
    @required this.onClear,
  }) : super(key: key);

  final Function(String) onChanged;
  final Function onClear;

  @override
  _FormNoHandphoneState createState() => _FormNoHandphoneState();
}

class _FormNoHandphoneState extends State<FormNoHandphone> {
  TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    _textController.addListener(widget.onClear);
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

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
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                          });
                        },
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
