import 'package:flutter/material.dart';
import 'package:homepage/models/topup_model.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class CheckoutBottomBar extends StatefulWidget {
  const CheckoutBottomBar({
    Key key,
    @required this.data,
  }) : super(key: key);

  final TopUpModel data;

  @override
  _CheckoutBottomBarState createState() => _CheckoutBottomBarState();
}

class _CheckoutBottomBarState extends State<CheckoutBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
        ],
      ),
      child: Wrap(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/payment_method');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                          (widget.data.paymentMethod == 'Saldo Robot Biru')
                              ? 'images/dompet.png'
                              : '',
                          width: 30),
                      SizedBox(width: 10),
                      Text(
                        widget.data.paymentMethod,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.data.currency} ${widget.data.accountBalance}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 2),
          if (widget.data.targetNumber != null &&
              widget.data.targetNumber != '' &&
              widget.data.chosenPackage != null)
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'Total Akhir:  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${widget.data.currency} ${widget.data.chosenPackage.content}',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          BigButton(
            title: 'Beli',
            onPressed: (widget.data.targetNumber != null &&
                    widget.data.targetNumber != '' &&
                    widget.data.chosenPackage != null)
                ? () {
                    Navigator.of(context)
                        .pushNamed('/pin_code', arguments: widget.data);
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
