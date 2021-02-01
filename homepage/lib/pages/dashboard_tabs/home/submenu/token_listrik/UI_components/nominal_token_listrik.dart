import 'package:flutter/material.dart';

class NominalTokenListrik extends StatefulWidget {
  const NominalTokenListrik({
    Key key,
    this.onChanged,
  }) : super(key: key);

  final Function(double) onChanged;

  @override
  _NominalTokenListrikState createState() => _NominalTokenListrikState();
}

class _NominalTokenListrikState extends State<NominalTokenListrik> {
  int selectedIndex = 0;
  double cashback = 750;
  double fee = 1750;
  double selectedValue = 21750;
  List<double> _boxTokenListrik = [
    20000,
    50000,
    75000,
    100000,
    200000,
    500000,
    1000000,
    5000000,
    10000000,
    50000000,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                  crossAxisCount: 2, childAspectRatio: 0.55),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedValue = _boxTokenListrik[selectedIndex] + fee;
                      widget.onChanged(selectedValue);
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
                          color: (selectedIndex == index)
                              ? Colors.blue
                              : Colors.grey[200],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _boxTokenListrik[index].toString(),
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
                            'Rp ${_boxTokenListrik[index] + fee}',
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
