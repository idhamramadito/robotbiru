import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/dana/page_dana.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/kereta/page_kereta.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/link_aja/page_link_aja.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/ovo/ovo.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/paket_data/page_paket_data.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/page_pesawat.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/order_forms/bagasi.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/shopee_pay/page_shopee_pay.dart';
import 'package:homepage/routing/default_route.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pulsa/page_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/page_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/invoice_token_listrik.dart';
import 'package:homepage/shared/shared_pages/invoice_topup.dart';
import 'package:homepage/shared/shared_pages/contacts_picker.dart';
import 'package:homepage/shared/shared_pages/pin_code.dart';
import 'package:homepage/shared/shared_pages/search_page.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/order_forms/harga_detail.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/order_forms/order_forms.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/pembayaran.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/ringkasan.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/payment/ticket_details_page.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/schedule_list/schedule_list.dart';
import 'package:homepage/shared/shared_pages/tiket_kendaraan/ticket_details/kebijakan_pembatalan.dart';
import 'package:homepage/shared/shared_pages/trans_completed.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/saldo/invoice_saldo.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/saldo/page_saldo.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/saldo/permintaan_topup_saldo.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/saldo/pilih_pembayaran_saldo.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/gopay/page_gopay.dart';

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
        return MaterialPageRoute(builder: (_) => PinCode(data: arg));
      case '/trans_completed':
        return MaterialPageRoute(builder: (_) => TransCompleted(data: arg));
      case '/contacts_picker':
        return MaterialPageRoute(builder: (_) => ContactsPicker());
      case '/invoice_topup':
        return MaterialPageRoute(builder: (_) => InvoiceTopUp());

      // khusus pulsa
      case '/pulsa':
        return MaterialPageRoute(builder: (_) => PagePulsa());

      // khusus gopay
      case '/gopay':
        return MaterialPageRoute(builder: (_) => PageGopay());

      // khusus paket data
      case '/paket_data':
        return MaterialPageRoute(builder: (_) => PagePaketData());

      // khusus ovo
      case '/ovo':
        return MaterialPageRoute(builder: (_) => PageOvo());
      // khusus dana
      case '/dana':
        return MaterialPageRoute(builder: (_) => PageDana());

      // khusus link aja
      case '/link_aja':
        return MaterialPageRoute(builder: (_) => PageLinkAja());
      // khusus ShopeePay
      case '/shopee_pay':
        return MaterialPageRoute(builder: (_) => PageShopeePay());

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
      case '/harga_detail':
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

      // khusus top up saldo
      case '/saldo':
        return MaterialPageRoute(builder: (_) => Saldo());
      case '/invoice_saldo':
        return MaterialPageRoute(builder: (_) => InvoiceSaldo());
      case '/permintaan_topup_saldo':
        return MaterialPageRoute(builder: (_) => PermintaanTopUpSaldo());
      case '/pilih_pembayaran_saldo':
        return MaterialPageRoute(builder: (_) => PilihPembayaranSaldo());

      default:
        return defaultRoute();
    }
  }
}
