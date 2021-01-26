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

  Widget container() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(child: Image.asset("images/profile_photo.png")),
                SizedBox(width: 10),
                Text(
                  "Dhimas Nur Ramadhan",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          Image.asset("images/logo.png", height: 25)
        ],
      ),
    );
  }
}
