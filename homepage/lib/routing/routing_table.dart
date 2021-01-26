import 'package:flutter/material.dart';
import 'package:homepage/pages/submenu/top_up/top_up.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/topup':
        return MaterialPageRoute(builder: (_) => TopUp());
      default:
        return errorRoute();
    }
  }
}
