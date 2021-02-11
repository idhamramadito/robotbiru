import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/page_kereta.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/page_pesawat.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/order_forms/bagasi.dart';
import 'package:homepage/routing/error_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/page_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/invoice_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/page_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/invoice_token_listrik.dart';
import 'package:homepage/shared/shared_pages/contacts_picker.dart';
import 'package:homepage/shared/shared_pages/pin_code.dart';
import 'package:homepage/shared/shared_pages/search_page.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/order_forms/order_forms.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/harga_detail.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/pembayaran.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/ringkasan.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/ticket_details_page.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/schedule_list/schedule_list.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/ticket_details/kebijakan_pembatalan.dart';
import 'package:homepage/shared/shared_pages/trans_completed.dart';

class RoutingTable {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      // Shared
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/search_page':
        SearchPage args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) =>
                SearchPage(pageName: args.pageName, dataList: args.dataList));
      case '/pin_code':
        return MaterialPageRoute(builder: (_) => PinCode(routeName: arg));
      case '/trans_completed':
        return MaterialPageRoute(
            builder: (_) => TransCompleted(routeName: arg));
      case '/contacts_picker':
        return MaterialPageRoute(builder: (_) => ContactsPicker());

      // khusus pulsa
      case '/pulsa':
        return MaterialPageRoute(builder: (_) => PagePulsa());
      case '/invoice_pulsa':
        return MaterialPageRoute(builder: (_) => InvoicePulsa());

      // khusus token listrik
      case '/token_listrik':
        return MaterialPageRoute(builder: (_) => PageTokenListrik());
      case '/invoice_token_listrik':
        return MaterialPageRoute(builder: (_) => InvoiceTokenListrik());

      // khusus tiket kendaraan
      case '/kebijakan_pembatalan':
        return MaterialPageRoute(builder: (_) => KebijakanPembatalan());
      case '/ticket_details_page':
        return MaterialPageRoute(
            builder: (_) => TicketDetailsPage(prevData: arg));
      case '/pemesanan':
        return MaterialPageRoute(builder: (_) => OrderForms(prevData: arg));
      case '/pembayaran':
        return MaterialPageRoute(builder: (_) => Pembayaran(previousData: arg));
      case '/ringkasan':
        return MaterialPageRoute(builder: (_) => Ringkasan(previousData: arg));
      case '/total_pembayaran':
        return MaterialPageRoute(builder: (_) => HargaDetail());
      case '/list_jadwal_kendaraan':
        return MaterialPageRoute(
            builder: (_) => ScheduleList(previousData: arg));

      // khusus tiket pesawat
      case '/pesawat':
        return MaterialPageRoute(builder: (_) => PagePesawat());
      case '/bagasi':
        return MaterialPageRoute(builder: (_) => Bagasi(datasebelum: arg));

      // khusus tiket kereta
      case '/kereta':
        return MaterialPageRoute(builder: (_) => PageKereta());

      default:
        return errorRoute();
    }
  }
}
