import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/other_services.dart';

class MainServices extends StatelessWidget {
  const MainServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 20),
      shrinkWrap: true,
      childAspectRatio: 1.5,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: [
        InkWell(
          child: Column(
            children: [
              Image.asset("images/jekbot_n.png", height: 40),
              Text("JekBot")
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Column(
            children: [
              Image.asset("images/taxibot_n.png", height: 40),
              Text("TaxiBot")
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Column(
            children: [
              Image.asset("images/sendbot_n.png", height: 40),
              Text("SendBot")
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Column(
            children: [
              Image.asset("images/foodbot_n.png", height: 40),
              Text("FoodBot")
            ],
          ),
          onTap: () {},
        ),
        InkWell(
          child: Column(
            children: [
              Image.asset("images/pulsa_n.png", height: 40),
              Text("Pulsa/"),
              Text("Paket Data")
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/submenu', arguments: 'Pulsa');
          },
        ),
        InkWell(
          child: Column(
            children: [
              Image.asset("images/dll_n.png", height: 40),
              Text("Lainnya")
            ],
          ),
          onTap: () {
            otherServices(context);
          },
        ),
      ],
    );
  }
}
