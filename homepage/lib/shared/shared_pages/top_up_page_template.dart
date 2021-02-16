import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';
import 'package:homepage/shared/shared_UI_components/checkout_bottom_bar.dart';
import 'package:homepage/shared/shared_UI_components/drop_down_jenis_nominal.dart';
import 'package:homepage/shared/shared_UI_components/number_form.dart';
import 'package:homepage/shared/shared_UI_components/package_desc.dart';
import 'package:homepage/shared/shared_UI_components/receipt_card.dart';
import 'package:homepage/shared/shared_UI_components/rememberme_checkbox.dart';

class TopUpPageTemplate extends StatefulWidget {
  const TopUpPageTemplate({
    Key key,
    @required TopUpModel dataList,
    @required List<TopUpPackageModel> packageList,
    @required List<NameAndContent> ringkasan,
    @required List<NameAndContent> cashback,
  })  : this.dataList = dataList,
        this.packageList = packageList,
        this.ringkasan = ringkasan,
        this.cashback = cashback,
        super(key: key);

  final TopUpModel dataList;
  final List<TopUpPackageModel> packageList;
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
              prompt: 'Nomor Handphone',
              clearButton: true,
              onChanged: (val) => setState(() {
                widget.dataList.targetNumber = val;
              }),
              externalPicker: 'contacts',
            ),
          ),
          RememberMeCheckBox(
            onChanged: () => setState(() {
              _rememberNumber = !_rememberNumber;
            }),
          ),
          if (widget.dataList.targetNumber != null &&
              widget.dataList.targetNumber != '')
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
            'Pilih Kontak',
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
                  'Nomor:',
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
