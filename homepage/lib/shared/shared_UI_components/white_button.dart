import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final List data;
  final VoidCallback onPressed;

  const WhiteButton({
    Key key,
    @required this.title,
    this.data,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Theme.of(context).primaryColor)),
            primary: Colors.white),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
