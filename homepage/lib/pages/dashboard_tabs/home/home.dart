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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  color: Color(0xff008AD5),
                  child: Column(
                    children: [
                      UserInfo(),
                      SizedBox(height: 20),
                      SearchBar(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                MainServices(),
                AccountBalance(),
              ],
            ),
            Container(
              height: 290,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 220,
                    color: Color(0xff008AD5),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: Card(
                      elevation: 5,
                      child: UpgradeToPartner(),
                    ),
                  ),
                  Infographics(),
                ],
              ),
            ),
            ComplaintButton(),
            SizedBox(height: 10),
            Container(
              height: 20,
              color: Color(0xffF2F3F5),
            ),
            PromoCard1(),
            SizedBox(height: 15),
            PromoCard2(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
  //========================= main function =========================
}
