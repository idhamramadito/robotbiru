import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  final String regex;
  final String displayName;
  final Function onChanged;
  InputTextField({
    Key key,
    @required this.regex,
    @required this.displayName,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.displayName,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: widget.displayName ?? '',
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(widget.regex),
              ),
            ],
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
