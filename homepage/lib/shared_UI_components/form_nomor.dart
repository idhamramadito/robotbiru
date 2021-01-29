import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNomor extends StatefulWidget {
  const FormNomor({
    Key key,
    @required this.onChanged,
    this.onClear,
    this.prompt,
    this.externalPicker,
  }) : super(key: key);

  final String prompt;
  final Function(String) onChanged;
  final Function onClear;
  final IconButton externalPicker;

  @override
  _FormNomorState createState() => _FormNomorState();
}

class _FormNomorState extends State<FormNomor> {
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
              widget.prompt ?? '',
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
                      suffixIcon: Visibility(
                        visible: (widget.onClear != null),
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
