import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/pulsa/form_no_handphone.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/pulsa/nominal_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/shared/card_cashback.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/shared/card_ringkasan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/shared/rememberme_checkbox.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/token_listrik/form_no_meteran.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/token_listrik/nominal_token_listrik.dart';

class InputBaru extends StatefulWidget {
  final String pageName;
  InputBaru({Key key, this.pageName}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  //============================= main function ===============================
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (widget.pageName == 'Pulsa') ? FormNoHandphone() : FormNoMeteran(),
          RememberMeCheckBox(),
          (widget.pageName == 'Pulsa') ? NominalPulsa() : NominalTokenListrik(),
          CardRingkasan(pageName: widget.pageName),
          Container(height: 10, color: Colors.grey[300]),
          CardCashback(),
        ],
      ),
    );
  }
  //============================= main function ===============================
}
