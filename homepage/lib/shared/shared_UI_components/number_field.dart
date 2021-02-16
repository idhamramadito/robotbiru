import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumberField extends StatefulWidget {
  final String initialValue;
  final String displayName;
  final Function onChanged;
  InputNumberField({
    Key key,
    @required this.initialValue,
    @required this.displayName,
    @required this.onChanged,
    TextInputType keyboardType,
    List<TextInputFormatter> inputFormatters,
  }) : super(key: key);

  @override
  _InputNumberFieldState createState() => _InputNumberFieldState();
}

class _InputNumberFieldState extends State<InputNumberField> {
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
            initialValue: widget.initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: widget.displayName ?? '',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
