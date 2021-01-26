import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("promo_name",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("promo_description",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Let's check tips for you"),
                SizedBox(height: 10),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset("images/promo${index + 1}.png")),
              ],
            ),
          );
        },
      ),
    );
  }
}
