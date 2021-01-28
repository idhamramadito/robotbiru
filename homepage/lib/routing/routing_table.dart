import 'package:flutter/material.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/shared_pages/pin_code.dart';
import 'package:homepage/pages/shared_pages/scan_barcode.dart';
import 'package:homepage/pages/dashboard_tabs/home/transaction_process/trans_completed.dart';
import 'package:homepage/pages/dashboard_tabs/home/transaction_process/trans_details.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/pulsa_page.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/token_listrik_page.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case '/pulsa':
        return MaterialPageRoute(
          builder: (_) => PulsaPage(),
        );
      case '/token_listrik':
        return MaterialPageRoute(
          builder: (_) => TokenListrikPage(),
        );
      case '/pin_code':
        return MaterialPageRoute(
          builder: (_) => PinCode(pageName: args),
        );
      case '/trans_completed':
        return MaterialPageRoute(
          builder: (_) => TransCompleted(pageName: args),
        );
      case '/trans_details':
        return MaterialPageRoute(
          builder: (_) => TransDetails(pageName: args),
        );
      case '/scan_barcode':
        return MaterialPageRoute(
          builder: (_) => ScanBarcode(),
        );
      default:
        return errorRoute();
    }
  }
}
