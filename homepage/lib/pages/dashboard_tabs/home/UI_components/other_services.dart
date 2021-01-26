
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Image.asset("images/dll_n.png", width: 40, height: 40),
          Text("Lainnya")
        ],
      ),
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          builder: (context) => Container(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 4,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Semua Menu Robot Biru",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/jekbot_n.png",
                                  width: 47,
                                  height: 46,
                                ),
                                Text("JekBot")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "images/taxibot_n.png",
                                width: 70,
                                height: 31,
                              ),
                              Text("TaxiBot")
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "images/sendbot_n.png",
                                width: 42,
                                height: 47,
                              ),
                              Text("SendBot")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/foodbot_n.png",
                                  width: 59,
                                  height: 34,
                                ),
                                Text("FoodBot")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "images/pulsa_n.png",
                                width: 40,
                                height: 47,
                              ),
                              Text("Pulsa/"),
                              Text("Paket Data")
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "images/martbot_n.png",
                                width: 40,
                                height: 41,
                              ),
                              Text("MartBot")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/boxbot_n.png",
                                  width: 55,
                                  height: 43,
                                ),
                                Text("BoxBot")
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/tiket_n.png",
                                  width: 56,
                                  height: 56,
                                ),
                                Text("Tiket"),
                                Text("Perjalanan")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "images/tagihan_n.png",
                                width: 56,
                                height: 56,
                              ),
                              Text("Pembayaran"),
                              Text("Tagihan")
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
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