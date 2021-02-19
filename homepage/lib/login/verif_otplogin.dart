import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:rbi_flutter/utils/uidata.dart';

var globalContext;
var no_hp;
var cnt = 0;
var stresend = false;

Timer _timer;
int _start = 60;

class PageVerifLogin extends StatefulWidget {
  PageVerifLogin({Key key, this.data}) : super(key: key);
  final String data;
  @override
  _PageVerifLogin createState() => _PageVerifLogin();
}

class _PageVerifLogin extends State<PageVerifLogin> {
  final kdverif = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    no_hp = widget.data;
    stresend = false;
    _start = 60;
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            stresend = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<String> kirimulangkode(String param) async {
    final response =
        await http.post("http://178.128.215.125:3000/resend_otp", body: {
      "no_hp": param,
    });
    final data = jsonDecode(response.body);
    print(response.body);

    if (data["status"] == "success") {
      setState(() {
        _start = 60;
        stresend = false;
      });
      startTimer();
    } else {
      //_loginStatus = LoginStatus.notSignIn;
      setState(() {
        //passerror = true;
      });
    }
    //print(data);
  }

  Future<String> verifikasilogin(String param) async {
    var dt = jsonDecode(param);
    final response = await http.post("http://178.128.215.125:3000/verif_otp",
        body: {"no_hp": dt["no_hp"], "kode": dt["kode"]});
    final data = jsonDecode(response.body);
    print(response.body);

    if (data["status"] == "success") {
      setState(() {});
      startTimer();
    } else {
      //_loginStatus = LoginStatus.notSignIn;
      setState(() {
        //passerror = true;
      });
    }
    //print(data);
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff008AD5),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(globalContext).pop(),
          ),
          title: Text('Verifikasi'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Verifikasi Akun Anda",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: kdverif,
                    maxLength: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: new TextStyle(color: Color(0xff818181)),
                      hintText: "Masukan Kode",
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: stresend
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            kirimulangkode(no_hp);
                          },
                          child: Text(
                            'Kirim Ulang Kode',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff008AD5)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '00:' + _start.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Anda tinggal memasukan kode OTP yang Robot Biru Whatsapp ke nomor HP Anda yang terdaftar",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                no_hp,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
                          margin: EdgeInsets.only(bottom: 10),
                          child: ButtonTheme(
                            minWidth: 300,
                            height: 50,
                            child: FlatButton(
                              onPressed: () {
                                verifikasilogin(jsonEncode(
                                    {"no_hp": no_hp, "kode": kdverif.text}));
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              child: Text(
                                "Konfirmasi",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff008AD5),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
