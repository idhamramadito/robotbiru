import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String title;
  final List data;
  final VoidCallback route;

  const BigButton({
    Key key,
    @required this.title,
    this.data,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: route,
      ),
    );
  }
}
