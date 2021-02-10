import 'package:flutter/material.dart';
// import 'package:homepage/shared/shared_UI_components/big_button.dart';

class TicketDetailsBottomBar extends StatelessWidget {
  final String sourcePage;

  const TicketDetailsBottomBar({
    Key key,
    this.sourcePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: sourcePage == 'Jadwal Pesawat',
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 307.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      "per orang",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Flexible(
            //   child: BigButton(
            //     title: 'Pesan Tiket',
            //     onPressed: () {
            //       Navigator.of(context).pushNamed('/pemesanan');
            //     },
            //   ),
            // ),
            // TODO: MASIH BUGGY, HARUS DIPERBAIKI
          ],
        ),
      ),
    );
  }
}
