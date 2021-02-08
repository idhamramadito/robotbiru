import 'package:flutter/material.dart';

class TabDetailed extends StatelessWidget {
  const TabDetailed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              dense: true,
              leading: Image.asset('images/japan_airlines.png'),
              title: Text(
                'Japan Airlines',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                'JT-22',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(child: Image.asset('images/gray_clock.png')),
                    Flexible(
                      child: Text(
                        '1j 50m',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'images/origin_to_destination.png',
                    height: 200,
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '05:00',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                'Jakarta (CGK)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Soekarno Hatta'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '1j 50m',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Langsung'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: Text(
                                '07:00',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Senin, 12 Jan 2021'),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: Text(
                                'Denpasar (DPS)',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Ngurah Rai'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kebijakan Pembatalan',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/kebijakan_pembatalan');
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Penumpang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '1. Tuan Anbiya Nur Rohmat',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 27,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Text(
                            "Dewasa",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'CGK - DPS',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Divider(thickness: 2),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '20 Januari 2021 ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
