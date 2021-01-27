import 'package:flutter/material.dart';

class Infographics extends StatelessWidget {
  const Infographics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: <JUMLAH DATA>
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Center(child: Text("Infografis $index")),
            ),
          );
        },
      ),
    );
  }
}
