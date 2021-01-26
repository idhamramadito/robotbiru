import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future otherServices(BuildContext context) {
  return showMaterialModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) => Container(
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Semua Menu Robot Biru",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1.2,
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
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset("images/martbot_n.png", height: 40),
                        Text("MartBot")
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset("images/boxbot_n.png", height: 40),
                        Text("BoxBot")
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset("images/tiket_n.png", height: 40),
                        Text("Tiket"),
                        Text("Perjalanan"),
                      ],
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Image.asset("images/tagihan_n.png", height: 40),
                        Text("Pembayaran"),
                        Text("Tagihan"),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
