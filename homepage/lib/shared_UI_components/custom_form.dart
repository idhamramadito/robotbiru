import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key key,
    @required this.onChanged,
    bool clearButton,
    this.prompt,
    this.externalPicker,
  })  : this.clearButton = clearButton ?? false,
        super(key: key);

  final bool clearButton;
  final String prompt;
  final Function(String) onChanged;
  final IconButton externalPicker;

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    _textController.addListener(() => widget.onChanged(_textController.text));
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
          Visibility(
            visible: (widget.prompt != null),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Text(
                widget.prompt ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    decoration: InputDecoration(
                      suffixIcon: Visibility(
                        visible: widget.clearButton,
                        child: IconButton(
                          icon: Icon(Icons.clear, size: 30),
                          onPressed: () {
                            setState(() {
                              _textController.clear();
                            });
                          },
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: widget.prompt ?? '',
                    ),
                  ),
                ),
                Visibility(
                  visible: (widget.externalPicker != null),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: widget.externalPicker,
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
