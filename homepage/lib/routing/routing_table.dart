import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/invoice_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/invoice_token_listrik.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/shared_pages/pin_code.dart';
import 'package:homepage/pages/shared_pages/trans_completed.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/pulsa_page.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/token_listrik_page.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/pulsa':
        return MaterialPageRoute(builder: (_) => PulsaPage());
      case '/invoice_pulsa':
        return MaterialPageRoute(builder: (_) => InvoicePulsa());
      case '/token_listrik':
        return MaterialPageRoute(builder: (_) => TokenListrikPage());
      case '/invoice_token_listrik':
        return MaterialPageRoute(builder: (_) => InvoiceTokenListrik());
      case '/pin_code':
        return MaterialPageRoute(builder: (_) => PinCode(routeName: args));
      case '/trans_completed':
        return MaterialPageRoute(
            builder: (_) => TransCompleted(routeName: args));

      default:
        return errorRoute();
    }
  }
}
