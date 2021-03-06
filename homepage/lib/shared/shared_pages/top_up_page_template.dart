import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/card_token_listrik.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/token_listrik/UI_components/nominal_token_listrik.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/shared/shared_UI_components/drop_down_jenis_nominal.dart';
import 'package:homepage/shared/shared_UI_components/number_form.dart';
import 'package:homepage/shared/shared_UI_components/package_desc.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';

class TopUpPageTemplate extends StatefulWidget {
  const TopUpPageTemplate({
    Key key,
    @required this.dataList,
    @required this.packageList,
    @required this.ringkasan,
    @required this.cashback,
    this.packageCashback,
    this.fee,
  }) : super(key: key);

  final TopUpModel dataList;
  final List<TopUpPackageModel> packageList;
  final double packageCashback;
  final double fee;
  final List<NameAndContent> ringkasan;
  final List<NameAndContent> cashback;

  @override
  _TopUpPageTemplateState createState() => _TopUpPageTemplateState();
}

class _TopUpPageTemplateState extends State<TopUpPageTemplate> {
  bool _rememberNumber = false;

  @override
  //============================= main function ===============================
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.dataList.transactionType}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TabBar(
                unselectedLabelColor: Theme.of(context).primaryColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                tabs: [
                  Tab(text: "Input Baru"),
                  Tab(text: "Daftar Favorit"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: TabBarView(
                children: [
                  _tabInputBaru(),
                  _tabDaftarFavorit(context),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CheckoutBottomBar(
          data: widget.dataList,
        ),
      ),
    );
  }
  //============================= main function ===============================

  Widget _tabInputBaru() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: NumberForm(
              initialValue: widget.dataList.targetNumber,
              prompt:
                  (widget.dataList.transactionType.contains('Token Listrik'))
                      ? 'ID Pelanggan / Nomor Meteran'
                      : 'Nomor Handphone',
              clearButton: true,
              onChanged: (val) => setState(() {
                widget.dataList.targetNumber = val;
              }),
              externalPicker:
                  (widget.dataList.transactionType.contains('Token Listrik'))
                      ? 'barcode'
                      : 'contacts',
            ),
          ),
          RememberMeCheckBox(
            onChanged: () => setState(() {
              _rememberNumber = !_rememberNumber;
            }),
          ),
          if (widget.dataList.targetNumber != null &&
              widget.dataList.targetNumber != '' &&
              widget.dataList.transactionType == 'Token Listrik')
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child:
                      CardTokenListrik(idNumber: widget.dataList.targetNumber),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: NominalTokenListrik(
                    data: widget.dataList,
                    packageList: widget.packageList,
                    packageCashback: widget.packageCashback,
                    fee: widget.fee,
                    onChanged: (val) => setState(() {
                      widget.dataList.chosenPackage = val;
                    }),
                  ),
                ),
              ],
            ),
          if (widget.dataList.targetNumber != null &&
              widget.dataList.targetNumber != '' &&
              widget.dataList.transactionType != 'Token Listrik')
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: DropDownJenisNominal(
                prevData: widget.dataList,
                nominalList: widget.packageList,
                onChanged: (val) => setState(() {
                  widget.dataList.chosenPackage = val;
                }),
              ),
            ),
          if (widget.dataList.targetNumber != null &&
              widget.dataList.targetNumber != '' &&
              widget.dataList.chosenPackage != null)
            Column(
              children: [
                if (widget.dataList.transactionType != 'Token Listrik')
                  PackageDesc(data: widget.dataList),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ReceiptCard(
                    title: 'Ringkasan',
                    dataList: widget.ringkasan,
                  ),
                ),
                Divider(thickness: 5),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ReceiptCard(
                    title: 'Cashback',
                    dataList: widget.cashback,
                  ),
                ),
                Divider(thickness: 5),
              ],
            ),
        ],
      ),
    );
  }

  Widget _tabDaftarFavorit(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Pilih Favorit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.dataList.targetNumber ?? 'Nomor:'}',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () async {
              final result = await Navigator.of(context).pushNamed(
                  '/contacts_picker'); // TODO: GANTI KE PAGE DAFTAR FAVORIT
              setState(() {
                widget.dataList.targetNumber =
                    result ?? widget.dataList.targetNumber;
              });
            },
          ),
        ),
      ],
    );
  }
}
