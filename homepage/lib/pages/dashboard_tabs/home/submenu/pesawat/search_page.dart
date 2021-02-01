import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
    this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pilih ${widget.pageName}',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 25),
                    hintText: (widget.pageName == 'Maskapai')
                        ? 'Cari Maskapai'
                        : 'Cari Kota atau Bandara'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
