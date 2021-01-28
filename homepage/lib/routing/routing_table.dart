import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/scan_barcode.dart';
import 'package:homepage/pages/shared_pages/trans_detail.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/shared_pages/pin_code.dart';
import 'package:homepage/pages/shared_pages/trans_completed.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/submenu':
        return MaterialPageRoute(builder: (_) => SubMenu(pageName: args));
      case '/pin_code':
        return MaterialPageRoute(builder: (_) => PinCode(hintText: args));
      case '/trans_completed':
        return MaterialPageRoute(builder: (_) => TransCompleted(data: args));
      case '/scan_barcode':
        return MaterialPageRoute(builder: (_) => ScanBarcode());
      case '/trans_details':
        return MaterialPageRoute(builder: (_) => HasilTrans());

      default:
        return errorRoute();
    }
  }
}
