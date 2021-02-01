import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/account_balance.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/complaint_button.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/infographics.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/main_services.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/promo_card.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/search_bar.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/upgrade_to_partner.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/user_info.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: UserInfo().appBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 280,
            ),
            Column(
              children: [
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
  //============================= main function ===============================
}
