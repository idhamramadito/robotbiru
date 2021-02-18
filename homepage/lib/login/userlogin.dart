import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard.dart';
import 'package:localstorage/localstorage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:homepage/pages/dashboard_tabs/home/home.dart';
// import 'package:rbi_flutter/utils/uidata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;
import 'package:homepage/login/verif_otplogin.dart';

var globalContext;
bool passerror = false;

final LocalStorage step = new LocalStorage('step');
final LocalStorage dtuser = new LocalStorage('dtuser');

class UserLogin extends StatefulWidget {
  UserLogin({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UserLoginState createState() => _UserLoginState();
}

enum LoginStatus { notSignIn, SignIn }

class _UserLoginState extends State<UserLogin> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String pengguna = "driver", no_hp, password;
  final _key = new GlobalKey<FormState>();
  final _keyotp = new GlobalKey<FormState>();

  String initialCountry = 'ID';
  PhoneNumber number =
      PhoneNumber(isoCode: 'ID', dialCode: '+62', phoneNumber: '81383101799');

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login('{"pengguna" : "konsumen", "no_hp":"' +
          no_hp +
          '","password":"' +
          password +
          '"}');
    }
  }

  check_otp() {
    final form = _keyotp.currentState;
    if (form.validate()) {
      form.save();
      login_otp('{"pengguna" : "konsumen", "no_hp":"' + no_hp + '"}');
      print(no_hp);
    }
  }

  Future<String> login(String param) async {
    var dt = jsonDecode(param);
    final response = await http.post("http://178.128.215.125:3000/login",
        body: {
          "pengguna": dt["pengguna"],
          "no_hp": dt["no_hp"],
          "password": dt["password"]
        });
    final data = jsonDecode(response.body);
    String status = data['status'];
    String pesan = data['message'];
    String no_hp1 = data['no_hp'];
    //print(no_hp1.toString());
    if (status == "success") {
      setState(() {
        _loginStatus = LoginStatus.SignIn;
        //savePref(status);
      });
      step.setItem('step', '1');
      step.setItem('dtuser', jsonEncode(data["result"]));
      var dtuser = jsonDecode(step.getItem('dtuser'));
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop,
              child: Dashboard(),
              inheritTheme: false,
              ctx: context),
          (Route<dynamic> route) => false);
    } else {
      _loginStatus = LoginStatus.notSignIn;
      setState(() {
        passerror = true;
      });

      print(pesan);
    }
    //print(data);
  }

  Future<String> login_otp(String param) async {
    var dt = jsonDecode(param);
    final response =
        await http.post("http://178.128.215.125:3000/login_otp", body: {
      "pengguna": dt["pengguna"],
      "no_hp": dt["no_hp"],
    });
    final data = jsonDecode(response.body);
    if (data["status"] == "success") {
      setState(() {
        //savePref(status);
      });
      step.setItem('step', '0');
      //step.setItem('dtuser', jsonEncode(data["result"]));
      //var dtuser = jsonDecode(step.getItem('dtuser'));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageVerifLogin(data: no_hp),
          ));
      /*
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: PageTransitionType.bottomToTop,
            child: PageVerifLogin(),
            inheritTheme: false,
            ctx: context),
            (Route<dynamic> route) => false
      );

       */
    } else {
      //_loginStatus = LoginStatus.notSignIn;
      setState(() {
        //passerror = true;
      });
    }
    //print(data);
  }

  savePref(String status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("status", status);
      preferences.commit();
    });
  }

  var status;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      status = preferences.getString("status");
      _loginStatus =
          status == "success" ? LoginStatus.SignIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(globalContext).pop(),
              ),
              title: Text('Masuk'),
              bottom: TabBar(
                tabs: [
                  Tab(
                      icon: Icon(Icons.directions_car),
                      text: 'Dengan Password'),
                  Tab(
                      icon: Icon(Icons.directions_transit),
                      text: 'Dengan Nomor HP'),
                ],
              ),
            ),
            backgroundColor: Color(0xff008AD5),
            body: TabBarView(
              children: [
                /*
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                        key: _key,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: Text("No HP Anda",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                              child: TextFormField(
                                initialValue: '081383101799',
                                validator: (e){
                                  if(e.isEmpty){
                                    return "tolong field no hp diisi";
                                  }
                                },
                                onSaved: (e)=> no_hp = e,
                                decoration: InputDecoration(
                                    labelText: 'No Hp'
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: Text("Kata Sandi(Password)",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                              child: TextFormField(
                                initialValue: 'qizwila12610',
                                validator: (e){
                                  if(e.isEmpty){
                                    return "tolong field password diisi";
                                  }
                                },
                                obscureText: _secureText,
                                onSaved: (e)=> password = e,
                                decoration: InputDecoration(
                                    labelText: 'password',
                                    suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(
                                          _secureText ? Icons.visibility_off  : Icons.visibility
                                      ),
                                    )
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 15),
                              child: ButtonTheme(
                                minWidth: 250,
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    // Navigator.of(context)
                                    //     .push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => PageVerifDaftar()
                                    //     )
                                    // );
                                    check();
                                  },
                                  color: Color(0xff008AD5),
                                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                                  child: Text("Masuk",
                                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Lupa? Ganti Kata Sandi (Password)",
                                style: TextStyle(color: Color(0xff6B6B6B)),),
                            ),
                          ],
                        )
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child:  Text("Belum Verifikasi? Klik Disini",
                                    style: TextStyle(color: Color(0xff6B6B6B)),),
                                ),
                                Container(
                                  child:  Text("Belum Punya Akun? Daftar Disini",
                                    style: TextStyle(color: Color(0xff6B6B6B)),),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
                */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                        key: _key,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30, left: 30),
                              child: Text(
                                "Masukan Nomor Handphone atau WhatsApp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      no_hp = number.phoneNumber;
                                      print(number.isoCode);
                                    },
                                    onSaved: (e) => no_hp = e.phoneNumber,
                                    textAlignVertical: TextAlignVertical.center,
                                    selectorConfig: SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET,
                                      backgroundColor: Colors.white,
                                      showFlags: false,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    initialValue: PhoneNumber(
                                        isoCode: 'ID',
                                        dialCode: '+62',
                                        phoneNumber: '81383101799'),
                                    selectorTextStyle:
                                        TextStyle(color: Colors.black),
                                    inputBorder: InputBorder.none,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 30),
                              child: Text(
                                "Masukan Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white),
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  initialValue: 'qizwila12610',
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "tolong field password diisi";
                                    }
                                  },
                                  obscureText: _secureText,
                                  onSaved: (e) => password = e,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'password',
                                      suffixIcon: IconButton(
                                        onPressed: showHide,
                                        icon: Icon(_secureText
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      )),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 30, right: 30),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    "Silahkan masuk untuk melakukan transaksi atau pembelian. Jika akun belum terverifikasi, silahkan verifikasi terlebih dahulu",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Align(
                        alignment: Alignment
                            .bottomCenter, // FractionalOffset.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 50,
                                    child: FlatButton(
                                      onPressed: () {
                                        check();
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      child: Text(
                                        "Masuk",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff008AD5),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "Belum Verifikasi? Klik Disini",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Belum Punya Akun? Daftar Disini",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                        key: _keyotp,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30, left: 30),
                              child: Text(
                                "Masukan Nomor Handphone atau WhatsApp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      no_hp = number.phoneNumber;
                                      print(number.isoCode);
                                    },
                                    onSaved: (e) => no_hp = e.phoneNumber,
                                    textAlignVertical: TextAlignVertical.center,
                                    selectorConfig: SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET,
                                      backgroundColor: Colors.white,
                                      showFlags: false,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    initialValue: PhoneNumber(
                                        isoCode: 'ID',
                                        dialCode: '+62',
                                        phoneNumber: '81383101799'),
                                    selectorTextStyle:
                                        TextStyle(color: Colors.black),
                                    inputBorder: InputBorder.none,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    "Silahkan masuk untuk melakukan transaksi atau pembelian. Jika akun belum terverifikasi, silahkan verifikasi terlebih dahulu",
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Align(
                        alignment: Alignment
                            .bottomCenter, // FractionalOffset.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 50,
                                    child: FlatButton(
                                      onPressed: () {
                                        check_otp();
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      child: Text(
                                        "Masuk",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff008AD5),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "Belum Verifikasi? Klik Disini",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Belum Punya Akun? Daftar Disini",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
        /*
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Masuk"),
            centerTitle: false,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: ,
        */
        );
  }
}
