import 'package:flutter/material.dart';

class DaftarFavorit extends StatefulWidget {
  DaftarFavorit({Key key, this.pageName}) : super(key: key);
  final String pageName;

  @override
  _DaftarFavoritState createState() => _DaftarFavoritState();
}

class _DaftarFavoritState extends State<DaftarFavorit> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Daftar Favorit'),
      ),
    );
  }
}
