import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
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
