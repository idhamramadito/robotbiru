import 'package:flutter/material.dart';

class ComplaintButton extends StatelessWidget {
  const ComplaintButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey),
        ),
        child: ListTile(
          dense: true,
          onTap: () {},
          leading: Icon(Icons.info, color: Colors.blue[800]),
          title: RichText(
            text: TextSpan(
              text: 'Punya Keluhan?  ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Silahkan Lapor Di Sini',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
