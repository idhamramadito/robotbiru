import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/account_balance.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/complaint_button.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/infographics.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/main_services.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/promo_card.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/search_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/upgrade_to_partner.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/user_info.dart';
import 'package:homepage/shared/UI_components/transparent_notif_and_navbar.dart';

class Home extends StatefulWidget {
  _PageDashboard createState() => _PageDashboard();
}

class _PageDashboard extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
    SystemChrome.setSystemUIOverlayStyle(
      transparentNotifBar(),
    );
  }

  //========================= main function =========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff008AD5), //grey = Color(0xffF2F3F5),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 300,
            ),
            Column(
              children: [
                UserInfo(),
                SearchBar(),
                AccountBalance(),
                MainServices(),
                UpgradeToPartner(),
                Infographics(),
                ComplaintButton(),
                PromoCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  //========================= main function =========================
}
