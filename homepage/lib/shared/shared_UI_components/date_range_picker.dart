import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

Future dateRangePicker(BuildContext context) async {
  final List<DateTime> picked = await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime.now().add(Duration(days: 0)),
      firstDate: new DateTime(DateTime.now().year - 50),
      lastDate: new DateTime(DateTime.now().year + 50));
  if (picked != null && picked.length == 1) {
    return picked[0];
  } else if (picked != null && picked.length == 2) {
    return picked;
  }
}
