import 'package:flutter/material.dart';
import 'package:homepage/pages/shared_pages/UI_component_trans/trans_listrik.dart';
import 'package:homepage/pages/shared_pages/UI_component_trans/trans_pulsa.dart';

class HasilTrans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.clear_rounded, color: Colors.grey),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              })
        ],
      ),
      body: Card(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                //TransPulsa(),
                TransListrik(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
