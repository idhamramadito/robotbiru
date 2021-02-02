import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePage extends StatefulWidget {
  DatePage({
    Key key,
    this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Jakarta > Denpasar-Bali',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
