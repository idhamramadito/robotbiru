import 'package:flutter/material.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/models/topup_package_model.dart';

class NominalTokenListrik extends StatefulWidget {
  final TopUpModel data;
  final List<TopUpPackageModel> packageList;
  final double packageCashback;
  final double fee;
  final Function(TopUpPackageModel) onChanged;

  const NominalTokenListrik({
    Key key,
    this.data,
    this.packageList,
    this.packageCashback,
    this.fee,
    this.onChanged,
  }) : super(key: key);

  @override
  _NominalTokenListrikState createState() => _NominalTokenListrikState();
}

class _NominalTokenListrikState extends State<NominalTokenListrik> {
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
              itemCount: widget.packageList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.onChanged(widget.packageList[index]);
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
                                  widget.packageList[index])
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
                            '${widget.packageList[index].name}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cashback Rp ${widget.packageCashback}',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Rp ${widget.packageList[index].price}',
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
