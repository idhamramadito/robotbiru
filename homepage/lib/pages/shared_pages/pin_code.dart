import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatefulWidget {
  final String routeName;
  const PinCode({Key key, this.routeName}) : super(key: key);

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  String currentText = '';
  String requiredAnswer = '123456';
  bool wrongInput = false;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Masukkan Pin Anda',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              backgroundColor: Colors.transparent,
              length: 6,
              obscureText: true,
              animationType: AnimationType.scale,
              enableActiveFill: true,
              errorAnimationController: errorController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
              onChanged: (value) {
                print(value);
                setState(() {
                  wrongInput = false;
                  currentText = value;
                });
              },
              onCompleted: (val) {
                if (val == requiredAnswer) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushNamed(
                    'trans_completed',
                    arguments: widget.routeName,
                  );
                } else {
                  setState(() {
                    wrongInput = true;
                  });
                  errorController.add(ErrorAnimationType.shake);
                }
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          ),
          (wrongInput)
              ? Text(
                  'Pin Tidak Sesuai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
