import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/card_cashback.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/card_ringkasan.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/formfield_nomor.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/nominal_pulsa.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/submenu_tabs/components/nominal_token_listrik.dart';

class InputBaru extends StatefulWidget {
  final String pageName;
  InputBaru({Key key, this.pageName}) : super(key: key);

  @override
  _InputBaruState createState() => _InputBaruState();
}

class _InputBaruState extends State<InputBaru> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  //============================= main function ===============================
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (widget.pageName == 'Pulsa')
              ? FormFieldNoHandphone()
              : FormFieldNoMeteran(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 25, 0),
            child: Row(
              children: [
                Checkbox(value: rememberMe, onChanged: _onRememberMeChanged),
                Text("Simpan Nomor",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
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
