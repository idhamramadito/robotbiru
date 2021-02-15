import 'package:flutter/material.dart';
import 'package:homepage/models/name_and_content.dart';

class NominalTokenListrik extends StatefulWidget {
  const NominalTokenListrik({
    Key key,
    this.onChanged,
  }) : super(key: key);

  final Function(NameAndContent) onChanged;

  @override
  _NominalTokenListrikState createState() => _NominalTokenListrikState();
}

class _NominalTokenListrikState extends State<NominalTokenListrik> {
  int selectedIndex = 0;
  double cashback = 750;
  double fee = 1750;
  List<NameAndContent> _boxTokenListrik = [
    NameAndContent(name: '20.000', content: 21750),
    NameAndContent(name: '50.000', content: 51750),
    NameAndContent(name: '75.000', content: 71750),
    NameAndContent(name: '100.000', content: 100750),
    NameAndContent(name: '500.000', content: 501750),
    NameAndContent(name: '1.000.000', content: 1001750),
    NameAndContent(name: '5.000.000', content: 5001750),
    NameAndContent(name: '10.000.000', content: 10001750),
    NameAndContent(name: '50.000.000', content: 50001750),
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
                      selectedIndex = index;
                      widget.onChanged(_boxTokenListrik[selectedIndex]);
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
                            'Rp ${_boxTokenListrik[index].content}',
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
