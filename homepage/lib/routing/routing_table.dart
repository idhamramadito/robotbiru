import 'package:flutter/material.dart';
import 'package:homepage/pages/submenu/pulsa/components/nominal_pulsa.dart';
import 'package:homepage/pages/submenu/pulsa/pulsapage.dart';
import 'package:homepage/pages/submenu/top_up/top_up.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/submenu/token_listrik/tokenpage.dart';

import '../pages/shared_pages/pin_code.dart';
import '../pages/shared_pages/trans_completed.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/topup':
        return MaterialPageRoute(builder: (_) => TopUp());
      case '/pulsa':
        return MaterialPageRoute(builder: (_) => PulsaPage());
      case '/token_listrik':
        return MaterialPageRoute(builder: (_) => TokenPage());
      case '/pin_code':
        return MaterialPageRoute(builder: (_) => PinCode(hintText: args));
      case '/nominal_pulsa':
        return MaterialPageRoute(builder: (_) => NominalPulsa());
      case '/trans_completed':
        return MaterialPageRoute(
            builder: (_) => TransCompleted(hintText: args));
      default:
        return errorRoute();
    }
  }
}
