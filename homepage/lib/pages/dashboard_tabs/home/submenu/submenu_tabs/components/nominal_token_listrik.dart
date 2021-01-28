import 'package:flutter/material.dart';

class NominalTokenListrik extends StatefulWidget {
  const NominalTokenListrik({Key key}) : super(key: key);

  @override
  _NominalTokenListrikState createState() => _NominalTokenListrikState();
}

class _NominalTokenListrikState extends State<NominalTokenListrik> {
  int selectedIndex = 0;
  String selectedValue = '20.000';
  List _boxTokenListrik = [
    ['20.000', 'Cashback: Rp 750.00', 'Rp21.750'],
    ['50.000', 'Cashback: Rp 750.00', 'Rp51.750'],
    ['75.000', 'Cashback: Rp 750.00', 'Rp75.750'],
    ['100.000', 'Cashback: Rp 750.00', 'Rp101.750'],
    ['200.000', 'Cashback: Rp 750.00', 'Rp201.750'],
    ['500.000', 'Cashback: Rp 750.00', 'Rp501.750'],
    ['1.000.000', 'Cashback: Rp 750.00', 'Rp1.001.750'],
    ['5.000.000', 'Cashback: Rp 750.00', 'Rp5.001.750'],
    ['10.000.000', 'Cashback: Rp 750.00', 'Rp10.001.750'],
    ['50.000.000', 'Cashback: Rp 750.00', 'Rp50.001.750'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
                width: 1000,
                height: 90,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(16.0),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Pelanggan",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(
                              "Martin Keren",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "435436346",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tarif/Daya",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(
                              "R2/3500VA",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
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
                      selectedValue = _boxTokenListrik[selectedIndex][0];
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
                            _boxTokenListrik[index][0],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _boxTokenListrik[index][1],
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _boxTokenListrik[index][2],
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
