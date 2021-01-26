import 'package:flutter/material.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
