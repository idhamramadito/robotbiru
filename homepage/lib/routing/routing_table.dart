import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/shared_pages/pin_code.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/shared_pages/scan_barcode.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu.dart';
import 'package:homepage/pages/dashboard_tabs/home/transaction_process/trans_completed.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';

import '../pages/dashboard_tabs/home/transaction_process/trans_details.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => Dashboard(),
        );
      case '/submenu':
        return MaterialPageRoute(
          builder: (_) => SubMenu(pageName: args),
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
