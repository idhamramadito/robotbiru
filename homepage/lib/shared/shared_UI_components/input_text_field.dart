import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  final String regex;
  final String initialValue;
  final String displayName;
  final Function onChanged;
  final TextInputType keyboardType;
  InputTextField({
    Key key,
    @required this.regex,
    @required this.onChanged,
    this.initialValue,
    this.displayName,
    this.keyboardType,
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
              '${widget.displayName ?? ''}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextFormField(
            initialValue: widget.initialValue,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: '${widget.displayName ?? ''}',
            ),
            inputFormatters: <TextInputFormatter>[
              (widget.displayName.contains('Email'))
                  ? FilteringTextInputFormatter.deny(
                      RegExp(widget.regex),
                    )
                  : FilteringTextInputFormatter.allow(
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
