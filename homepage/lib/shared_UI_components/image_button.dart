import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/UI_components/other_services.dart';

class ImageButton extends StatelessWidget {
  final List data;
  final int index;
  const ImageButton({Key key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Image.asset(
            "images/${data[index].iconUrl}",
            height: 40,
          ),
          Text(data[index].name, textAlign: TextAlign.center),
        ],
      ),
      onTap: () {
        (data[index].route != null)
            ? Navigator.of(context).pushNamed(data[index].route)
            : otherServices(context);
      },
    );
  }
}
