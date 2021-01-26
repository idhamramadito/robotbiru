import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PageDashboard extends StatefulWidget {
  _PageDashboard createState() => _PageDashboard();
}

class _PageDashboard extends State<PageDashboard> {
  //========================= main function =========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  color: Color(0xff008AD5),
                  child: Column(
                    children: [
                      UserInfo(),
                      SizedBox(height: 20),
                      SearchBar(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: MainServices(),
                ),
                AccountBalance(),
              ],
            ),
            Container(
              height: 290,
              child: Stack(
                children: [
                  Container(
                    height: 90,
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    height: 220,
                    color: Color(0xff008AD5),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                    child: Card(
                      elevation: 5,
                      child: UpgradeToPartner(),
                    ),
                  ),
                  Infographics(),
                ],
              ),
            ),
            ComplaintButton(),
            SizedBox(height: 10),
            Container(
              height: 20,
              color: Color(0xffF2F3F5),
            ),
            PromoCard_1(),
            SizedBox(height: 15),
            PromoCard_2(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
  //========================= main function =========================
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Image.asset(
                  "images/profile_photo.png",
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "Dhimas Nur Ramadhan",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Image.asset(
              "images/logo.png",
              width: 65,
              height: 26,
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
            onPressed: () {},
            color: Color(0xffFAFAFA),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            child: Row(
              children: [
                Container(
                  child: Image.asset(
                    "images/search.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Mau Cari Apa?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff818181),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150, right: 15, left: 15),
      child: Card(
        elevation: 5,
        child: Container(
          width: 330,
          height: 80,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Image.asset(
                  "images/dompet.png",
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Saldo Anda",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Rp 12.000",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff008AD5)),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                child: ButtonTheme(
                  minWidth: 50,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/topup');
                    },
                    color: Color(0xff008AD5),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Text(
                      "Isi Saldo",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainServices extends StatelessWidget {
  const MainServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/jekbot_n.png"),
                    ),
                    Text("JekBot")
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/taxibot_n.png"),
                    ),
                    Text("TaxiBot")
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/sendbot_n.png"),
                    ),
                    Text("SendBot")
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/foodbot_n.png"),
                    ),
                    Text("FoodBot")
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/pulsa');
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("images/pulsa_n.png"),
                    ),
                    Text("Pulsa/"),
                    Text("Paket Data")
                  ],
                ),
              ),
              OtherServices(),
            ],
          ),
        ),
      ],
    );
  }
}

class OtherServices extends StatelessWidget {
  const OtherServices({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                ));
      },
      child: Column(
        children: [
          Image.asset(
            "images/dll_n.png",
            width: 40,
            height: 40,
          ),
          Text("Lainya")
        ],
      ),
    );
  }
}

class UpgradeToPartner extends StatelessWidget {
  const UpgradeToPartner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 80,
      color: Color(0xff008AD5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Upgrade Menjadi",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "Mitra Robot Biru Yuk",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: ButtonTheme(
              minWidth: 50,
              height: 40,
              child: FlatButton(
                onPressed: () {},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: Text(
                  "Retail",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff008AD5),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: ButtonTheme(
              minWidth: 50,
              height: 50,
              child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  child: Container(
                      width: 55,
                      height: 50,
                      child: Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Komunitas/Koperasi",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff008AD5),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}

class Infographics extends StatelessWidget {
  const Infographics({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: new Center(
                child: new Text("Infografis"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintButton extends StatelessWidget {
  const ComplaintButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: ButtonTheme(
        minWidth: 300,
        height: 50,
        child: FlatButton(
          onPressed: () {},
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey)),
          child: Text(
            "Punya Keluhan ? Silahkan Lapor Disini",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class PromoCard_1 extends StatelessWidget {
  const PromoCard_1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "BotRide",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Jaga Selalu Diri Anda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("Let's check tips for you"),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset("images/promo3.png"),
          ),
        ],
      ),
    );
  }
}

class PromoCard_2 extends StatelessWidget {
  const PromoCard_2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "BotFood",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Jaga Selalu Diri Anda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text("Let's check tips for you"),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset("images/promo1.png"),
          ),
        ],
      ),
    );
  }
}
