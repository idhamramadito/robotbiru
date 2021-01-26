import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(
                    child: Image.asset("images/profile_photo.png", height: 30)),
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
