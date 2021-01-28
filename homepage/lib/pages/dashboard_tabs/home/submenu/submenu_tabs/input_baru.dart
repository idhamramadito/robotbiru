import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/pulsa/form_no_handphone.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/pulsa/nominal_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/shared/card_cashback.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/shared/card_ringkasan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/shared/rememberme_checkbox.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/token_listrik/form_no_meteran.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/UI_components/token_listrik/nominal_token_listrik.dart';

class InputBaru extends StatefulWidget {
  final String pageName;
  InputBaru({Key key, this.pageName}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  List<Widget> _pulsaPageWidgetList = [
    FormNoHandphone(),
    RememberMeCheckBox(),
    NominalPulsa(),
    CardRingkasan(pageName: 'Pulsa'),
    Divider(thickness: 5),
    CardCashback(),
    Divider(thickness: 5),
  ];

  List<Widget> _tokenPageWidgetList = [
    FormNoMeteran(),
    RememberMeCheckBox(),
    NominalTokenListrik(),
    CardRingkasan(pageName: 'Token Listrik'),
    Divider(thickness: 5),
    CardCashback(),
    Divider(thickness: 5),
  ];
  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: (widget.pageName == 'Pulsa')
            ? _pulsaPageWidgetList
            : _tokenPageWidgetList,
      ),
    );
  }
  //============================= main function ===============================
}
