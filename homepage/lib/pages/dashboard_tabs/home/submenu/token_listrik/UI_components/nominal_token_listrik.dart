import 'package:flutter/material.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';

class NominalTokenListrik extends StatefulWidget {
  const NominalTokenListrik({
    Key key,
    this.onChanged,
    this.data,
  }) : super(key: key);

  final TopUpModel data;
  final Function(TopUpPackageModel) onChanged;

  @override
  _NominalTokenListrikState createState() => _NominalTokenListrikState();
}

class _NominalTokenListrikState extends State<NominalTokenListrik> {
  double cashback = 750;
  double fee = 1750;
  List<TopUpPackageModel> _boxTokenListrik = [
    TopUpPackageModel(name: '20.000', price: 21750),
    TopUpPackageModel(name: '50.000', price: 51750),
    TopUpPackageModel(name: '75.000', price: 71750),
    TopUpPackageModel(name: '100.000', price: 100750),
    TopUpPackageModel(name: '500.000', price: 501750),
    TopUpPackageModel(name: '1.000.000', price: 1001750),
    TopUpPackageModel(name: '5.000.000', price: 5001750),
    TopUpPackageModel(name: '10.000.000', price: 10001750),
    TopUpPackageModel(name: '50.000.000', price: 50001750),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nominal Token Listrik",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _boxTokenListrik.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.onChanged(_boxTokenListrik[index]);
                    });
                  },
                  child: Container(
                    width: 500,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: (widget.data.chosenPackage ==
                                  _boxTokenListrik[index])
                              ? Theme.of(context).primaryColor
                              : Colors.grey[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${_boxTokenListrik[index].name}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cashback Rp $cashback',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Rp ${_boxTokenListrik[index].price}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
