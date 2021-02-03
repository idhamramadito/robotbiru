import 'package:flutter/material.dart';

class TabPerjalanan extends StatelessWidget {
  const TabPerjalanan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
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
          Divider(),
          SizedBox(height: 10),
          InkWell(
            child: Text(
              'Kebijakan Pembatalan',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/kebijakan_pembatalan');
            },
          ),
        ],
      ),
    );
  }
}
