import 'package:flutter/material.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Halaman tidak tersedia.'),
      ),
    );
  });
}
