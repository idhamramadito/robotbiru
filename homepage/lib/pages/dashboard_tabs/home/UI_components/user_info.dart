import 'package:flutter/material.dart';

class UserInfo {
  Widget appBar() {
    return AppBar(
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {},
          child: CircleAvatar(child: Image.asset("images/profile_photo.png")),
        ),
      ),
      title: Text("Dhimas Nur Ramadhan", style: TextStyle(fontSize: 15)),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset("images/logo.png", width: 60),
        )
      ],
    );
  }
}
