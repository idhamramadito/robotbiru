import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/api_models/fetched_data_list.dart';
import 'package:homepage/models/api_models/payment.dart';
import 'package:homepage/service/api_service.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:provider/provider.dart';

class PilihPembayaranSaldo extends StatefulWidget {
  @override
  _PilihPembayaranSaldoState createState() => _PilihPembayaranSaldoState();
}

class _PilihPembayaranSaldoState extends State<PilihPembayaranSaldo> {
  int selectedIndex;
  Future _dataFromAPI;

  @override
  void initState() {
    _dataFromAPI =
        Provider.of<APIService>(context, listen: false).getTrainPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(color: Colors.green),
            alignment: Alignment.center,
            child: Text('Proses Pengecekan Pembayaran sekitar 5-10 menit.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
          Flexible(
            child: FutureBuilder<Response<FetchedDataList>>(
              future: _dataFromAPI,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.3,
                      ),
                    );
                  }
                  final list = snapshot.data.body.result;
                  return _buildList(context, list);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        child: BigButton(
          title: 'Top Up',
          onPressed: (selectedIndex == null)
              ? null
              : () =>
                  Navigator.of(context).pushNamed('/permintaan_topup_saldo'),
        ),
      ),
    );
  }

  ListView _buildList(BuildContext context, List<Payment> list) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemExtent: 100,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          value: index,
          groupValue: selectedIndex,
          onChanged: (int value) {
            setState(() {
              selectedIndex = value;
            });
          },
          title: Image.asset('images/dompet.png'), //TODO: fotonya di mana???
          secondary: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transfer ${list[index].name}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              if (list[index].norek != null)
                Text('${list[index].norek}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              Text(
                '${list[index].atasNama}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              if (list[index].start != null || list[index].end != null)
                Text(
                  'Jam Operasional ${list[index].start}-${list[index].end} WIB',
                  style: TextStyle(fontSize: 10),
                ),
            ],
          ),
        );
      },
    );
  }
}
