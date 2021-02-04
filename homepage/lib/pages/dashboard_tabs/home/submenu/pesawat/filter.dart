import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> with SingleTickerProviderStateMixin {
  List _rekomendasi = [
    "Harga Terendah",
    "Keberangkatan Paling Awal",
    "Keberangkatan Paling Akhir",
    "Kedatangan Paling Awal",
    "Kedatangan Paling Akhir",
    "Durasi Tercepat"
  ];
  bool rememberMe = false;
  List _filterDengan = [
    ["Langsung", false],
    ["1 Transit", false],
    ["2 Transit", false],
  ];

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Urutkan & Filter"),
                        ],
                      )),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Urutkan"),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 342,
                          child: ExpansionTile(
                            title: Text(
                              "Rekomendasi",
                            ),
                            children: <Widget>[
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _rekomendasi.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(_rekomendasi[index]),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text("Filter Dengan"),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Text("Durasi Transit"),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _filterDengan.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          child: Row(
                                        children: [
                                          new Text(
                                            _filterDengan[index][0],
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ));
                                    })
                              ]),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
