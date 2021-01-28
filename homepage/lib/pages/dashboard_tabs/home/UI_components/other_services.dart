import 'package:flutter/material.dart';

Future otherServices(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Menu Utama Robot Biru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20),
                  childAspectRatio: 1.5,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/jekbot_n.png", height: 35),
                          Text("JekBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/taxibot_n.png", height: 35),
                          Text("TaxiBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/sendbot_n.png", height: 35),
                          Text("SendBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/foodbot_n.png", height: 35),
                          Text("FoodBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/pulsa_n.png", height: 35),
                          Text("Pulsa/"),
                          Text("Paket Data")
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/pulsa');
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/martbot_n.png", height: 35),
                          Text("MartBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/boxbot_n.png", height: 35),
                          Text("BoxBot")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/tiket_n.png", height: 35),
                          Text("Tiket"),
                          Text("Perjalanan"),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/tagihan_n.png", height: 35),
                          Text("Pembayaran"),
                          Text("Tagihan"),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Top Up",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20),
                  childAspectRatio: 1.5,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/pulsa.png", height: 40),
                          Text("Pulsa")
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/pulsa');
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/paket data.png", height: 40),
                          Text("Paket Data")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/token listrik.png", height: 40),
                          Text("Token Listrik")
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/token_listrik');
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/ovo.png", height: 40),
                          Text("OVO")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/gopay.png", height: 40),
                          Text("GoPay")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/link_aja.png", height: 40),
                          Text("Link Aja")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/dana.png", height: 40),
                          Text("Dana")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/shopee_pay.png", height: 40),
                          Text("Shopee Pay")
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Perjalanan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20),
                  childAspectRatio: 1.5,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/pesawat.png", height: 40),
                          Text("Pesawat")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/kereta.png", height: 40),
                          Text("Kereta")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/web_check_in.png", height: 40),
                          Text("Web Check In")
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Bayar Tagihan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20),
                  childAspectRatio: 1.5,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/pln.png", height: 40),
                          Text("PLN")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/indihome.png", height: 40),
                          Text("Indihome")
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset("images/gas_negara.png", height: 40),
                          Text("Gas Negara")
                        ],
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
