import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

Future dateRangePicker(BuildContext context) async {
  final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime.now().add(Duration(days: 2)),
      firstDate: new DateTime.now().subtract(Duration(days: 1)),
      lastDate: new DateTime(DateTime.now().year + 50));
  if (picked != null && picked.length == 2) {
    return picked;
  }
}

Future datePicker(BuildContext context) async {
  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(DateTime.now().year + 50));
  return picked;
}
