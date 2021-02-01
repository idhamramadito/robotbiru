import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/page_pesawat.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/search_page.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/kelas_kabin.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/page_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/invoice_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/page_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/invoice_token_listrik.dart';
import 'package:homepage/shared/shared_pages/contacts_picker.dart';
import 'package:homepage/shared/shared_pages/pin_code.dart';
import 'package:homepage/shared/shared_pages/trans_completed.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/pulsa':
        return MaterialPageRoute(builder: (_) => PagePulsa());
      case '/token_listrik':
        return MaterialPageRoute(builder: (_) => PageTokenListrik());
      case '/cabin_class':
        return MaterialPageRoute(builder: (_) => KelasKabin());
      case '/pesawat':
        return MaterialPageRoute(builder: (_) => PagePesawat());
      case '/search_page':
        return MaterialPageRoute(builder: (_) => SearchPage(pageName: args));
      case '/invoice_pulsa':
        return MaterialPageRoute(builder: (_) => InvoicePulsa());
      case '/invoice_token_listrik':
        return MaterialPageRoute(builder: (_) => InvoiceTokenListrik());
      case '/pin_code':
        return MaterialPageRoute(builder: (_) => PinCode(routeName: args));
      case '/trans_completed':
        return MaterialPageRoute(
            builder: (_) => TransCompleted(routeName: args));
      case '/contacts_picker':
        return MaterialPageRoute(builder: (_) => ContactsPicker());
      default:
        return errorRoute();
    }
  }
}
