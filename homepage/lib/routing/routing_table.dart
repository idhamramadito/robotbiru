import 'package:flutter/material.dart';
import 'package:homepage/routing/error_route.dart';

import '../dashboard.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return errorRoute();
    }
  }
}
