import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';

class CheckoutBottomBar extends StatefulWidget {
  const CheckoutBottomBar({
    Key key,
    @required this.currency,
    @required this.accountBalance,
    @required this.chosenPrice,
    @required this.paymentMethod,
    @required this.paymentLogo,
    @required this.routeName,
  }) : super(key: key);

  final String routeName;
  final String currency;
  final String paymentMethod;
  final String paymentLogo;
  final double accountBalance;
  final double chosenPrice;

  @override
  _CheckoutBottomBarState createState() => _CheckoutBottomBarState();
}

class _CheckoutBottomBarState extends State<CheckoutBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.1))
        ],
      ),
      child: Column(
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
                      Image.asset(widget.paymentLogo, width: 30),
                      SizedBox(width: 10),
                      Text(
                        widget.paymentMethod,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  Text(
                    '${widget.currency} ${widget.accountBalance.toString()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 2),
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
                    text: '${widget.currency} ${widget.chosenPrice.toString()}',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          BigButton(
            title: 'Beli',
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/pin_code', arguments: widget.routeName);
            },
          ),
        ],
      ),
    );
  }
}
